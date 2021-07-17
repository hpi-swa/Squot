public graph patching
apply: aGraphDiff toLoadedGraph: anObjectGraph
	"Materialize the changed versions of each shadow into existing objects or create new objects."
	"When an object is updated, only the references listed the diff should be filled in, the rest remains as is and is not pending. Updated objects will have pending references until the targets have also been updated. Updated objects may need to be refreshed (e. g. Sets rehashed) after all references have been resolved; compared to full rematerialization of the graph, this refreshing happens in place of reactivating the new objects. For objects created during the patching, all their references must be filled in. Such objects must eventually be reactivated like during full materialization. We currently rely on #transitiveChange to be listed in the diffs, rather than computing the referrers by ourselves."
	| walk |
	sourceGraph := aGraphDiff right.
	"queue diff for start and updating the start reference"
	walk := SquotGraphWalk startingFrom: {aGraphDiff asStartDiff. anObjectGraph. SquotObjectGraphMirror new. aGraphDiff right. SquotObjectGraphMirror new. aGraphDiff left. SquotObjectGraphMirror new}.
	walk doNotTrackReferrers.
	[walk atEnd] whileFalse:
		[ | next diff object mirror newShadow shadowMirror oldShadow oldShadowMirror remaining |
		next := walk next. diff := next first. object := next second. mirror := next third. newShadow := next fourth. shadowMirror := next fifth. oldShadow := next sixth. oldShadowMirror := next seventh.
		object := diff update: object reflectedIn: mirror
			asMaterializedFrom: newShadow reflectedIn: shadowMirror.
		"Oftentimes the new object is also the old object (same instance)." self flag: #todo. "But if it is not, we need a new mirror."
		self take: object asMaterializedFrom: newShadow.
		remaining := OrderedCollection new.
		diff referenceDiffsWithDefaultOwners: {oldShadow. newShadow} reflectedIn: shadowMirror do:
			[:each | self applyReferenceDiff: each to: object reflectedIn: mirror
						new: newShadow reflectedIn: shadowMirror
						old: oldShadow reflectedIn: oldShadowMirror
						from: aGraphDiff
						ifDeferred: [remaining add: each reference]
						nextDiffsDo: [:valueDiff :value :valueMirror :valueShadow  :valueShadowMirror :oldValueShadow | walk add: {valueDiff. value. valueMirror. valueShadow. valueShadowMirror. oldValueShadow. oldShadowMirror mirrorOf: oldValueShadow reachedVia: each reference from: oldShadow} reachedVia: each]].
		remaining
			ifEmpty: [self reactivate: object]
			ifNotEmpty: [pendingOutgoingReferences at: object put: remaining].
		self assignIdentifierIfAnyTo: object reflectedIn: mirror in: anObjectGraph materializedFrom: newShadow.
		self updateReferrersTo: object materializedFrom: newShadow].
	pendingOutgoingReferences ifNotEmpty: [self error: 'Objects not fully updated'].
	^ anObjectGraph