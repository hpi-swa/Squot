converting
topNodes
	left isLoadable ifFalse: [^ #()].
	^ (left diffAgainst: left absentCopy) topNodes