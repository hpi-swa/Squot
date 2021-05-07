test fixture
prepareIncomingVersion
	| newOrder |
	super prepareIncomingVersion.
	newOrder := self workingCopy loadOrder copy.
	newOrder swap: 1 with: 2.
	self workingCopy loadOrder: newOrder.