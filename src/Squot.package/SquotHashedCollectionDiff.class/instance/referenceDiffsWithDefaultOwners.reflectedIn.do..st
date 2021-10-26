Squot-diff-enumerating
referenceDiffsWithDefaultOwners: leftAndRightShadows reflectedIn: aMirror do: aBlock
	"Convert SquotSlotDiffs into SquotReferenceDiffs."
	slotChanges associations
		collect: [:each | each asReferenceDiffWithDefaultOwners: leftAndRightShadows reflectedIn: aMirror]
		thenDo: aBlock.
	itemChanges associations
		collect: [:each | each asReferenceDiffWithDefaultOwners: leftAndRightShadows reflectedIn: aMirror]
		thenDo: aBlock.