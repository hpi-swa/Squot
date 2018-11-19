actions
handlingCredentialsOf: aHistorian do: aBlock ifCanceled: cancelBlock
	aBlock
	on: NeedGitCredentials do: [:e | | credentials |
		credentials :=
			self requestAndStoreCredentialsFor: aHistorian repository
				remoteUrl: e repositoryUrl asString
				ifCanceled: cancelBlock.
		e resume: credentials]
	on: GitRemoteAuthenticationFailed do: [:e | | message |
		message := 'Authentication with the remote failed. Please check your credentials.'.
		((self remoteUrlOf: aHistorian) includesSubstring: 'github.com')
			ifTrue: [message := message, ' If you have two-factor authentification enabled, you must use a personal access token instead of your GitHub login password.'].
		self inform: message]