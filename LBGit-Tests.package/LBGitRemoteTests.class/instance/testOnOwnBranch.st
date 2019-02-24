tests
testOnOwnBranch

	<timeout: 20>
	self 
		assert: self branchName 
		equals: self workingCopy loadedHistorian shortName