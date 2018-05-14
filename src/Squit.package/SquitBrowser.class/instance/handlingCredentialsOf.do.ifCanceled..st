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
		message := 'Authentication with the remote failed for some reason.'.
		e responseBody ifNotEmpty: [
			message := message , String crlf , 
				'The following might give a hint of what has happened:' , String crlf , String crlf, 
				e responseBody , String crlf].
		((self remoteUrlOf: aHistorian) includesSubstring: 'github.com')
			ifTrue: [message := message, String crlf , 'Also please note: If you have two-factor authentification enabled,'
				, String crlf, 'you must use a personal access token instead of your GitHub login password.'].
		self inform: message]