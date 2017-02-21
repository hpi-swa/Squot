git-delegating
branch: branchName message: aMessage
"Creates a commit in branch ==branchName== with message ==aMessage==. If the branch doesn't exist it will be created."

	self basicCommit: aMessage to: branchName.
	(branchName = self branchName)
		ifFalse: [ self basicSwitchToBranch: branchName ]