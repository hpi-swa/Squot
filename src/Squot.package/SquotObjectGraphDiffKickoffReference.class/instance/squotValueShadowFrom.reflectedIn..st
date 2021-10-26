patching
squotValueShadowFrom: aShadow reflectedIn: aMirror
	^ objectDiff isRemoval
		ifTrue: [reference reflect: leftOwner in: leftOwnerMirror]
		ifFalse: [reference reflect: rightOwner in: rightOwnerMirror]