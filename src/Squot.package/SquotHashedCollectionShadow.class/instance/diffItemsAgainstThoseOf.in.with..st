comparing
diffItemsAgainstThoseOf: rightShadow in: aHashedCollectionDiff with: aDiffBuilder
	^ aHashedCollectionDiff
		diffItems: itemSlots
		againstThoseOf: rightShadow
		with: aDiffBuilder