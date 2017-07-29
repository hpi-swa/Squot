as yet unclassified
apply: aDiff toLoaded: anObject
	| existing deferred patched |
	existing := patchedObjects at: anObject
			ifAbsentPut: [deferred := SquotPlaceholder new].
	(existing notNil and: [existing ~~ deferred]) ifTrue: [self isThisEverCalled. ^ existing].
	[patched := aDiff squotApplyToLoaded: anObject with: self.
	deferred ifNotNil: [deferred becomeForward: patched copyHash: false]]
	ensure: [(patched isNil and: [deferred notNil])
			ifTrue: [patchedObjects removeKey: anObject]].
	^ patched