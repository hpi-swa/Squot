running
performTest 

	 [super performTest]
		on: NeedGitCredentials do: [:e | e resume: self credentials].