patching
squotReflectOn: aShadow in: aMirror ifNewValue: newBlock ifOldValue: oldBlock
	"I have only an old value."
	^ oldBlock value: (reference reflect: aShadow in: aMirror)