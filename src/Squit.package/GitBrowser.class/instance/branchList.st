as yet unclassified
branchList
	^ #('-- Branches --'),
		(self projectSelection
			ifNil: [#()]
			ifNotNil: [:project |
				project repository historians, project repository remoteHistorians
					collect: [:historian | SquitHistorianWrapper on: historian]])