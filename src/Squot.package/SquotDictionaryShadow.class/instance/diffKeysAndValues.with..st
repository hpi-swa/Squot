as yet unclassified
diffKeysAndValues: leftDictionarySlots with: aDiffBuilder
	| changes left right addedAssociationNames removedAssociationNames |
	changes := Dictionary new.
	left := Dictionary newFrom: (leftDictionarySlots collect: [:each | each name -> each]).
	right := Dictionary newFrom: (itemSlots collect: [:each | each name -> each]).
	addedAssociationNames := right keys difference: left keys.
	removedAssociationNames := left keys difference: right keys.
	addedAssociationNames do: [:each | changes add:
		(SquotSlotAddition key: each newSlot: (right at: each))].
	removedAssociationNames do: [:each | changes add:
		(SquotSlotRemoval newFrom: (left at: each))].
	(right keys difference: addedAssociationNames)
		do: [:each | changes add:
			((aDiffBuilder left: (left at: each) right: (right at: each))
				asSquotSlotDiffWithKey: each)].
	^ changes