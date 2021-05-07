internal
basicSwitchToBranch: branchName
	self unitOfWork updateHeadToBranch: branchName.
	self basicReset.