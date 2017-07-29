as yet unclassified
apply: aDiff to: aShadow
	| patched placeholder |
	patchedObjects at: aShadow undecorated
		ifPresent: [:it | self isThisEverCalled. ^ it]
		ifAbsentPut: [placeholder := SquotPlaceholder new].
	patched := aDiff squotApplyTo: aShadow with: self.
	patchedObjects at: aShadow put: patched.
	placeholder ifNotNil: [placeholder becomeForward: patched copyHash: false].
	aShadow hasSquotShadowName ifTrue:
		[patchedObjectGraph assign: aShadow name toShadow: patched].
	^ patched