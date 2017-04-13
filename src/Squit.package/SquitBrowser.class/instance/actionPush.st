actions
actionPush
	| historian |
	historian := self branchSelection historian.
	self projectSelection repository
		exportToUpstream: historian
		ifNone: [UIManager default inform: 'No upstream branch configured for ', historian name]
