comparing
diffItems: leftItemSlots with: aDiffBuilder
	| changes left right addedNames removedNames |
	changes := Dictionary new.
	left := Dictionary newFrom: (leftItemSlots collect: [:each | each value name -> each value]).
	right := Dictionary newFrom: (itemSlots collect: [:each | each value name -> each value]).
	addedNames := right keys difference: left keys.
	removedNames := left keys difference: right keys.
	addedNames do: [:each | changes add:
		(SquotSlotAddition key: each newSlot: (right at: each))].
	removedNames do: [:each | changes add:
		(SquotSlotRemoval newFrom: (left at: each))].
	(right keys difference: addedNames)
		do: [:each | | slotDiff |
			slotDiff := (aDiffBuilder
				leftSlot: (left associationAt: each)
				rightSlot: (right associationAt: each)).
			slotDiff squotHasChanges ifTrue: [changes add: slotDiff]].
	^ changes