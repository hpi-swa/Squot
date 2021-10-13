error handling
requestAndStoreCredentialsFor: repository remoteUrl: remoteUrl ifCanceled: cancelBlock

	| credentials gitRepository |
	credentials := SquitCredentialsFillInMorph requestCredentials
		ifNil: [^ cancelBlock value].
		
	repository
		addCredentialsFor: remoteUrl
		user: (credentials at: #username)
		password: (credentials at: #password).
		
	gitRepository := repository git.
	gitRepository configAt: 'user.name' put: (credentials at: #displayName).
	gitRepository configAt: 'user.email' put: (credentials at: #email).
		
	^ repository credentialsFor: remoteUrl