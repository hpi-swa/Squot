building
walkUpToEnd
	walk do:
		[:eachTuple | | isAddedObject |
		currentTuple := eachTuple.
		isAddedObject := eachTuple first isNil.
		isAddedObject
			ifTrue: [client handleAdded: eachTuple third basedOn: eachTuple second for: self]
			ifFalse: [client handleExisting: eachTuple first basedOn: eachTuple second incoming: eachTuple third for: self]].