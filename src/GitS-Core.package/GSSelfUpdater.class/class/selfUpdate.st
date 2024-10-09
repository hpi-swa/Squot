self-updating
selfUpdate
	Metacello new
		baseline: self projectName;
		repository: (self metacelloRepositorySpecForVersion: self branchName);
		get; load.