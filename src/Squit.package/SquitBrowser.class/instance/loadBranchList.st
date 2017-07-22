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
				(historians includes: project loadedHistorian) ifFalse:
					[historians := historians copyWithFirst: project loadedHistorian].
				historians collect: [:historian | historian shortName]]).
	list ~= branchList ifTrue:
		[branchList := list.
		self activeBranchChanged].