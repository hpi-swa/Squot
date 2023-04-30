ui
branchListIfRepositoryDoesNotExist
	^ self projectList size > 1
		ifTrue: [#('-- Repository disappeared --')]
		ifFalse: [#('-- Branches --')]