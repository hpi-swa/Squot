as yet unclassified
diffKeysAndValues: leftDictionarySlots with: aDiffBuilder
putAddedInto: added
putRemovedInto: removed
putModifiedInto: modified
	| left right addedAssociationNames removedAssociationNames |
	left := Dictionary newFrom: (leftDictionarySlots collect: [:each | each name -> each]).
	right := Dictionary newFrom: (itemSlots collect: [:each | each name -> each]).
	addedAssociationNames := right keys difference: left keys.
	removedAssociationNames := left keys difference: right keys.
	addedAssociationNames do: [:each | added
			at: each
			put: (aDiffBuilder onlyRight: (right at: each))].
	removedAssociationNames do: [:each | removed
			at: each
			put: (aDiffBuilder onlyLeft: (left at: each))].
	(right keys difference: addedAssociationNames)
		do: [:each | modified
				at: each
				put: (aDiffBuilder left: (left at: each) right: (right at: each))]