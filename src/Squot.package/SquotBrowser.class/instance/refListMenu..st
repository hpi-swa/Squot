menu
refListMenu: aMenu
	self activeRef ifNotNil: [ | isBranch |
		self commitMenu: aMenu.
		aMenu target: self.
		isBranch := self activeWorkingCopy isSqueakBranchRef: self activeRef.
		isBranch ifTrue: [aMenu add: 'switch to this branch' action: #actionSwitchToActiveBranch].
		aMenu add: ('merge this {1}' format: {isBranch ifTrue: ['branch'] ifFalse: ['ref']}) action: #actionMergeActiveRef].
	aMenu target: self.
	aMenu add: (self showGitRefs ifTrue: ['<yes>'] ifFalse: ['<no>']), 'show git refs' action: #toggleShowGitRefs.
	^ aMenu