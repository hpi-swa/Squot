building
walkUpToEnd
	walk do:
		[:eachTuple | | isAddedObject existing base incoming |
		currentTuple := eachTuple.
		existing := eachTuple first.
		base := eachTuple second.
		incoming := eachTuple third.
		isAddedObject := existing isNil.
		isAddedObject
			ifTrue: [client handleAdded: incoming basedOn: base for: self]
			ifFalse: [client handleExisting: existing basedOn: base incoming: incoming for: self]].