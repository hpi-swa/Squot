credentials
handleCredentialsDuring: aBlock ifCanceled: anotherBlock
	^ aBlock
		on: NeedGitCredentials
		do: [:notification |
			notification resume:
				(self
					getCredentialsFor: notification repositoryUrl
					ifCanceled: [^ anotherBlock value])]
		on: GitRemoteAuthenticationFailed
		do: [:error |
			self removeCredentialsFor: error remote url asUrl.
			(self confirm: 'Invalid credentials. Do you want to try again?')
				ifTrue: [^ self handleCredentialsDuring: aBlock ifCanceled: anotherBlock]
				ifFalse: [^ anotherBlock value]]