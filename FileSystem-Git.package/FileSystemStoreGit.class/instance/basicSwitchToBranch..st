internal
basicSwitchToBranch: branchName
	repository updateHeadToBranch: branchName.
	self basicReset.