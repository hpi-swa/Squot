menu
refListMenu: aMenu
	| isBranch |
	self activeRef ifNil: [^ aMenu].
	self commitMenu: aMenu.
	aMenu target: self.
	isBranch := self activeWorkingCopy isSqueakBranchRef: self activeRef.
	isBranch ifTrue: [aMenu add: 'switch to this branch' action: #actionSwitchToActiveBranch].
	aMenu add: ('merge this {1}' format: {isBranch ifTrue: ['branch'] ifFalse: ['ref']}) action: #actionMergeActiveRef.
	^ aMenu