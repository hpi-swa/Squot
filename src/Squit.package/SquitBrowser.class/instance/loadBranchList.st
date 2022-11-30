ui
loadBranchList
	| list |
	repositoryExists ifFalse:
		[branchList := self branchListIfRepositoryDoesNotExist.
		^ self changed: #branchList].
	list := self projectSelection
			ifNil: [#()]
			ifNotNil: [:project | | historians localHistorians remoteHistorians |
				localHistorians := project repository historians sort: [:a :b | a name <= b name].
				remoteHistorians := project repository remoteHistorians sort: [:a :b | a name <= b name].
				historians := localHistorians, remoteHistorians.
				indexOfFirstRemoteTrackingBranch := localHistorians size + 1.
				(historians includes: project loadedHistorian) ifFalse:
					[historians := historians copyWithFirst: project loadedHistorian].
				historians collect:
					[:historian |
					historian isRemoteTrackingHistorian
						ifTrue: [historian shortName asText addAttribute: (TextColor color: Color gray darker); yourself]
						ifFalse: [historian shortName]]].
	list ~= branchList ifTrue:
		[branchList := list.
		self activeBranchChanged].