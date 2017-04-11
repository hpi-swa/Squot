as yet unclassified
branchList
	^ #('-- Branches --'),
		(self projectSelection
			ifNil: [#()]
			ifNotNil: [:project |
				project repository historians
					collect: [:historian | SquitHistorianWrapper on: historian]])