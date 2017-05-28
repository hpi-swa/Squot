ui
branchList
	repositoryExists ifFalse: [^ #('-- Repository disappeared --')].
	^ #('-- Branches --'),
		(self projectSelection
			ifNil: [#()]
			ifNotNil: [:project | | historians |
				historians := project repository historians, project repository remoteHistorians.
				(historians includes: project loadedHistorian)
					ifFalse: [historians := historians copyWithFirst: project loadedHistorian].
				historians collect: [:historian | SquitHistorianWrapper on: historian]])