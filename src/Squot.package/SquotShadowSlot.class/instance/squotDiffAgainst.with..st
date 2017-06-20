Squot-diffing
squotDiffAgainst: otherSlot with: aDiffBuilder
	| valueDiff |
	valueDiff := aDiffBuilder left: self value right: otherSlot value.
	^ valueDiff asSquotSlotDiffWithKey: self key