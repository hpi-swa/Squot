ui
branchList
	^ #('-- Branches --'),
		(self projectSelection
			ifNil: [#()]
			ifNotNil: [:project |
				project repository historians, project repository remoteHistorians
					collect: [:historian | | wrapper |
						wrapper := SquitHistorianWrapper on: historian.
						historian = self projectSelection loadedHistorian
							ifTrue: [wrapper displayText: '* ', historian name].
						wrapper]])