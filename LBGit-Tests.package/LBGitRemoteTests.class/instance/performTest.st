running
performTest 

	 [super performTest]
		on: NeedGitCredentials do: [:e | e resume: self credentials]
		on: ConnectionTimedOut do: [:e | self fail: e].