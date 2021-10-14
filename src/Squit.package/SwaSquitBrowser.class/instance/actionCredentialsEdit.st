actions
actionCredentialsEdit

	| credentials repository gitRepository remoteUrl |
	
	repository := self selectedRepository repository.
	gitRepository := repository git.
	remoteUrl := (repository remoteNames collect:
		[:each | (gitRepository remoteUrl: each)]
		thenSelect: [:each | each beginsWith: 'http']) first.
	credentials := SquitCredentialsFillInMorph requestCredentials.
	credentials ifNil: [^ nil].
		
	repository
		addCredentialsFor: remoteUrl
		user: (credentials at: #username)
		password: (credentials at: #password).
		
	gitRepository configAt: 'user.name' put: (credentials at: #displayName).
	gitRepository configAt: 'user.email' put: (credentials at: #email).