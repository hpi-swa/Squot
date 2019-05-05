running
createBranch

	[self workingCopy repository gitRepository 
		pushToUpstreamBranchOf: self branchName 
		ifNone: [self fail]]
		on: NeedGitCredentials do: [:e | e resume: self credentials].