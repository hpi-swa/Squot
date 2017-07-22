comparing
diffItems: leftItemSlots with: aDiffBuilder
	| changes left right addedNames removedNames |
	changes := Dictionary new.
	left := Dictionary newFrom: (leftItemSlots collect: [:each | each value name -> each]).
	right := Dictionary newFrom: (itemSlots collect: [:each | each value name -> each]).
	addedNames := right keys difference: left keys.
	removedNames := left keys difference: right keys.
	addedNames do: [:each | changes add:
		(SquotSlotAddition key: each newSlot: (right at: each))].
	removedNames do: [:each | changes add:
		(SquotSlotRemoval key: each removedSlot: (left at: each))].
	(right keys difference: addedNames)
		do: [:each | | slotDiff |
			slotDiff := (aDiffBuilder
				leftSlot: (left at: each)
				rightSlot: (right at: each)).
			slotDiff squotHasChanges ifTrue: [changes add: slotDiff]].
	^ changes