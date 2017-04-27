ui
branchList
	repositoryExists ifFalse: [^ #('-- Repository disappeared --')].
	^ #('-- Branches --'),
		(self projectSelection
			ifNil: [#()]
			ifNotNil: [:project |
				project repository historians, project repository remoteHistorians
					collect: [:historian | SquitHistorianWrapper on: historian]])