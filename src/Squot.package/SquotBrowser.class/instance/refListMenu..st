menu
refListMenu: aMenu
	self activeRef ifNotNil: [ | isBranch refTypeName |
		aMenu target: self.
		isBranch := self activeWorkingCopy isSqueakBranchRef: self activeRef.
		refTypeName := isBranch ifTrue: ['branch'] ifFalse: ['ref'].
		isBranch ifTrue: [aMenu add: 'Switch to this branch' action: #actionSwitchToActiveBranch].
		aMenu
			add: ('Merge this {1}' format: {refTypeName}) action: #actionMergeActiveRef;
			add: ('Delete this {1}' format: {refTypeName}) action: #actionDeleteActiveRef;
			addLine.
		self commitMenu: aMenu].
	aMenu target: self.
	aMenu hasItems ifTrue: [aMenu addLine].
	aMenu add: (self showGitRefs ifTrue: ['<yes>'] ifFalse: ['<no>']), 'Show git refs' action: #toggleShowGitRefs.
	^ aMenu