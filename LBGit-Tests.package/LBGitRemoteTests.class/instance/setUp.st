running
setUp 
	<timeout: 20>
	super setUp.
	self 
		setUpAdditionalWorkingCopy;
		suppressProgressDisplayDuring: [self 
			setUpRemoteFor: self workingCopy;
			setUpRemoteFor: self otherWorkingCopy;
			createBranch].
	self workingCopy register.
	self otherWorkingCopy register.
	self browser: LBGitSquitBrowserForTests new.