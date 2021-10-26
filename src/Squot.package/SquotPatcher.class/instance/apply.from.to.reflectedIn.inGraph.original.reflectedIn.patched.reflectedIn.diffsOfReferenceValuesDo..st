public graph patching
apply: diff from: aGraphDiff to: targetObject reflectedIn: mirror inGraph: anObjectGraph original: oldShadow reflectedIn: oldShadowMirror patched: newShadow reflectedIn: shadowMirror diffsOfReferenceValuesDo: walkBlock
	| remaining object |
	object := targetObject.
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
					nextDiffsDo: [:valueDiff :value :valueMirror :valueShadow  :valueShadowMirror :oldValueShadow | walkBlock valueWithArguments: {each. valueDiff. value. valueMirror. valueShadow. valueShadowMirror. oldValueShadow. oldShadowMirror mirrorOf: oldValueShadow reachedVia: each reference from: oldShadow}]].
	remaining
		ifEmpty: [self reactivate: object]
		ifNotEmpty: [pendingOutgoingReferences at: object put: remaining].
	self assignIdentifierIfAnyTo: object reflectedIn: mirror in: anObjectGraph materializedFrom: newShadow.
	self updateReferrersTo: object materializedFrom: newShadow
