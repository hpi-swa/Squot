running
tearDown 
	<timeout: 20>
	self suppressProgressDisplayDuring: [self deleteBranch].
	self otherReference delete.
	self workingCopy unregister.
	self otherWorkingCopy unregister.
	super tearDown.