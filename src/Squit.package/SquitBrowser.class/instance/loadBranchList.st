ui
loadBranchList
	| list |
	repositoryExists ifFalse:
		[branchList := #('-- Repository disappeared --').
		^ self changed: #branchList].
	list := #('-- Branches --'),
		(self projectSelection
			ifNil: [#()]
			ifNotNil: [:project | | historians localHistorians |
				localHistorians := project repository historians sort: [:a :b | a name <= b name].
				historians := localHistorians, project repository remoteHistorians.
				indexOfActiveHistorianInBranchList := historians indexOf: project loadedHistorian.
				indexOfActiveHistorianInBranchList = 0
					ifTrue: [historians := historians copyWithFirst: project loadedHistorian.
						indexOfActiveHistorianInBranchList := 1].
				historians collect: [:historian | historian shortName]]).
	list ~= branchList ifTrue:
		[branchList := list.
		self changed: #branchList].