ui
loadBranchList
	| list |
	repositoryExists ifFalse:
		[branchList := #('-- Repository disappeared --').
		^ self changed: #branchList].
	list := self projectSelection
			ifNil: [#()]
			ifNotNil: [:project | | historians localHistorians remoteHistorians |
				localHistorians := project repository historians sort: [:a :b | a name <= b name].
				remoteHistorians := project repository remoteHistorians sort: [:a :b | a name <= b name].
				historians := localHistorians, remoteHistorians.
				(historians includes: project loadedHistorian) ifFalse:
					[historians := historians copyWithFirst: project loadedHistorian].
				historians collect: [:historian | historian shortName]].
	list ~= branchList ifTrue:
		[branchList := list.
		self activeBranchChanged].