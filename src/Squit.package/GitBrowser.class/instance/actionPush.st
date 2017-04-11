actions
actionPush
	| branchName |
	branchName := self branchSelection historian name.
	self projectSelection repository gitRepository
		pushToUpstreamBranchOf: branchName
		ifNone: [UIManager default inform: 'No upstream branch configured for ', branchName]