menu
refListMenu: aMenu
	self activeRef ifNotNil: [ | isBranch refTypeName |
		aMenu target: self.
		isBranch := self activeWorkingCopy isSqueakBranchRef: self activeRef.
		refTypeName := self refTypeName: self activeRef.
		isBranch ifTrue: [aMenu add: 'Switch to this branch' action: #actionSwitchToActiveBranch].
		aMenu
			add: ('Delete this {1}' format: {refTypeName}) action: #actionDeleteActiveRef;
			addLine.
		self commitMenu: aMenu forRef: self activeRef].
	aMenu target: self.
	aMenu hasItems ifTrue: [aMenu addLine].
	aMenu
		add: 'Refresh refs'
		action: #actionRefreshRefList;
		add: (self showGitRefs ifTrue: ['<yes>'] ifFalse: ['<no>']), 'Show git refs'
		action: #toggleShowGitRefs.
	^ aMenu