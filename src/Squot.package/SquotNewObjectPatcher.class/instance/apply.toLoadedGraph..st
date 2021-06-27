public graph patching
apply: aGraphDiff toLoadedGraph: anObjectGraph
	"Materialize the changed versions of each shadow into existing objects or create new objects."
	"When an object is updated, only the references listed the diff should be filled in, the rest remains as is and is not pending. Updated objects will have pending references until the targets have also been updated. Updated objects may need to be refreshed (e. g. Sets rehashed) after all references have been resolved; compared to full rematerialization of the graph, this refreshing happens in place of reactivating the new objects. For objects created during the patching, all their references must be filled in. Such objects must eventually be reactivated like during full materialization. We currently rely on #transitiveChange to be listed in the diffs, rather than computing the referrers by ourselves."
	| walk |
	sourceGraph := aGraphDiff right.
	"queue diff for start and updating the start reference"
	walk := SquotGraphWalk startingFrom: {aGraphDiff asStartDiff. anObjectGraph. SquotObjectGraphMirror new. aGraphDiff right. SquotObjectGraphMirror new. aGraphDiff left. SquotObjectGraphMirror new}.
	walk doNotTrackReferrers.
	"queue all diffs, each diff contains one or more updates to the references of its target object"
	"apply all diffs to their objects, updating their references, refreshing the objects when all their references were updated"
	"updating a reference might entail materializing new objects, filling in of their references should be queued likewise"
	[walk atEnd] whileFalse:
		[ | next diff object mirror newShadow shadowMirror oldShadow oldShadowMirror remaining name |
		next := walk next. diff := next first. object := next second. mirror := next third. newShadow := next fourth. shadowMirror := next fifth. oldShadow := next sixth. oldShadowMirror := next seventh.
		object := diff update: object reflectedIn: mirror
			asMaterializedFrom: newShadow reflectedIn: shadowMirror.
		"Oftentimes the new object is also the old object (same instance).
		TODO: But if it is not, we need a new mirror."
		self take: object asMaterializedFrom: newShadow.
		remaining := OrderedCollection new.
		diff referenceDiffsWithDefaultOwners: {newShadow "because we do not have the original shadow readily available, and in most cases the original one does not matter". newShadow} reflectedIn: shadowMirror do:
			[:each | | block |
			block :=
				[:valueShadow |
				self applying: each
					fill: valueShadow reachedVia: each reference
					into: object reflectedIn: mirror
					ifDeferredUntilActivated: [remaining add: each reference]
					ifNotTreatedYet:
						["Could be new or just not yet patched."
						| value isNew valueMirror valueShadowMirror valueName valueDiff |
						valueShadowMirror := shadowMirror mirrorOf: valueShadow undecorated reachedVia: each reference from: newShadow undecorated.
						isNew := false.
						value := self findOrCreateMaterializedInstanceOf: valueShadow reflectedIn: valueShadowMirror ifNew: [:newValue | isNew := true].
						valueMirror := mirror mirrorOf: value reachedVia: each reference from: object.
						valueName := aGraphDiff right nameOf: valueShadow undecorated ifAbsent: [].
						valueDiff := aGraphDiff diffForObjectNamed: valueName ifAbsent: [].
						isNew & valueDiff isNil
							ifTrue: [valueDiff := SquotObjectAddition of: valueShadow].
						valueDiff
							ifNil: [each squotReflectOn: object in: mirror withValue: value]
							ifNotNil:
								[| oldValueShadow |
								oldValueShadow := (valueName ifNil: [valueShadow] ifNotNil: [aGraphDiff left shadowNamed: valueName ifAbsent: [valueShadow]])  undecorated.
								walk add: {valueDiff. value. valueMirror. valueShadow. valueShadowMirror. oldValueShadow. oldShadowMirror mirrorOf: oldValueShadow reachedVia: each reference from: oldShadow} reachedVia: each.
								remaining add: each reference]]].
			each squotReflectOn: oldShadow in: oldShadowMirror
				ifNewValue: block
				ifOldValue: block].
		remaining
			ifEmpty: [self reactivate: object]
			ifNotEmpty: [pendingOutgoingReferences at: object put: remaining].
		self updateReferrersTo: object materializedFrom: newShadow.
		"Assign identifier if any."
		name := self sourceNameOf: newShadow ifPresent: [:sourceName | sourceName] ifAbsent: [].
		(mirror shouldObjectHaveNameAssigned: object)
			ifTrue:
				[name
					ifNil: [self error: 'Object has no name but it should have']
					ifNotNil: [objectRegistry assign: name to: object]].
		name ifNotNil: [anObjectGraph assign: name to: object]].
	pendingOutgoingReferences ifNotEmpty: [self error: 'Objects not fully updated'].
	^ anObjectGraph