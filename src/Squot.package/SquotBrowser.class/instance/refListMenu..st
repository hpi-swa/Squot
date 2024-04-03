menu
refListMenu: aMenu
	self activeRef ifNotNil: [ | isBranch refTypeName |
		aMenu target: self.
		isBranch := self activeWorkingCopy isSqueakBranchRef: self activeRef.
		refTypeName := self refTypeName: self activeRef.
		aMenu addTitle: ('{1} {2}' format: {refTypeName capitalized. (GitReference shortName: self activeRef) printString}).
		isBranch ifTrue: [aMenu add: 'Switch to it' action: #actionSwitchToActiveBranch].
		aMenu
			add: 'Delete it' action: #actionDeleteActiveRef;
			addLine.
		self commitMenu: aMenu forRef: self activeRef.
		isBranch ifTrue: [
			aMenu
				addLine;
				add: 'Set its remote branch' action: #actionSetUpstreamOfActiveBranch;
				add: 'Unset its remote branch' action: #actionUnsetUpstreamOfActiveBranch]].
	aMenu target: self.
	aMenu hasItems ifTrue: [aMenu addLine].
	aMenu
		add: 'Refresh refs'
		action: #actionRefreshRefList;
		add: (self showGitRefs ifTrue: ['<yes>'] ifFalse: ['<no>']), 'Show git refs'
		action: #toggleShowGitRefs.
	^ aMenu