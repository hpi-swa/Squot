actions
actionCreateBranchAtRefAndSwitchToIt: aString
	self actionSwitchToBranch: ((self actionCreateBranchAtRef: aString) ifNil: [^ self]).