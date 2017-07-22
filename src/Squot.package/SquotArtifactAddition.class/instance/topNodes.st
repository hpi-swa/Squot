converting
topNodes
	right isLoadable ifFalse: [^ #()].
	^ (right absentCopy diffAgainst: right) topNodes