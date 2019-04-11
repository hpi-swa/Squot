running
deleteBranch

	[self workingCopy repository gitRepository pushToRemote: 'origin' deleteRemoteBranches: {self branchName}] on: NeedGitCredentials do: [:e | e resume: self credentials].