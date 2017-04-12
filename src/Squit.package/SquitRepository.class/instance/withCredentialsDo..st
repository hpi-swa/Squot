synchronizing
withCredentialsDo: aBlock
	^ aBlock on: NeedGitCredentials do: [:e | e resume: (self credentialsFor: e repositoryUrl asString)]