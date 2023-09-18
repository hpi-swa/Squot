credentials
handleCredentialsDuring: aBlock ifCanceled: anotherBlock
	^ aBlock
		on: NeedGitCredentials
		do: [:notification |
			notification resume:
				(self
					getCredentialsFor: notification repositoryUrl
					ifCanceled: [^ anotherBlock value])]