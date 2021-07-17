patching
squotReflectOn: anObject in: aMirror ifNewValue: newValueBlock ifOldValue: oldValueBlock
	^ objectDiff isRemoval
		ifTrue: [oldValueBlock value: (reference reflect: leftOwner in: leftOwnerMirror)]
		ifFalse: [newValueBlock value: (reference reflect: rightOwner in: rightOwnerMirror)]