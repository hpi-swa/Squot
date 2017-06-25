as yet unclassified
apply: aDiff to: aMetaobject
	| existing deferred patched |
	aMetaobject shallowCopy == aMetaobject ifFalse:
		"do not remember primitive values here"
		[existing := patchedObjects at: aMetaobject
			ifAbsentPut: [deferred := SquotPlaceholder new]].
	(existing notNil and: [existing ~~ deferred]) ifTrue: [^ existing].
	[patched := aDiff squotApplyTo: aMetaobject with: self.
	(deferred notNil and: [patched ~~ patched shallowCopy])
		ifTrue: [deferred becomeForward: patched]]
	ensure: [(patched isNil and: [deferred notNil])
			ifTrue: [patchedObjects removeKey: aMetaobject]].
	^ patched