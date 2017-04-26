synchronizing
withCredentialsDo: aBlock
	^ aBlock on: NeedGitCredentials do:
		[:e | | storedCredentials |
		storedCredentials := self credentialsFor: e repositoryUrl asString.
		storedCredentials
			ifNil: [e pass]
			ifNotNil: [e resume: storedCredentials]]