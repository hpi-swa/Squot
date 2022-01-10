error handling
requestAndStoreCredentialsFor: repository remoteUrl: remoteUrl ifCanceled: cancelBlock

	| credentials gitRepository displayName email |
	credentials := SquitCredentialsFillInMorph requestCredentials
		ifNil: [^ cancelBlock value].
		
	repository
		addCredentialsFor: remoteUrl
		user: (credentials at: #username)
		password: (credentials at: #password).
		
	gitRepository := repository git.
	displayName := credentials at: #displayName.
	email := credentials at: #email.
	displayName ifNotNil: [GitStamp defaultName: displayName].
	email ifNotNil: [GitStamp defaultEmail: email].
	gitRepository configAt: 'user.name' put: displayName.
	gitRepository configAt: 'user.email' put: email.
		
	^ repository credentialsFor: remoteUrl
