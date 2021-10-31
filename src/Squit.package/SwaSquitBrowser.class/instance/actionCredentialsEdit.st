actions
actionCredentialsEdit

	| credentials repository gitRepository remoteUrl displayName email |
	
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
		
	displayName := credentials at: #displayName.
	email := credentials at: #email.
	displayName ifNotNil: [GitStamp defaultName: displayName].
	email ifNotNil: [GitStamp defaultEmail: email].
	gitRepository configAt: 'user.name' put: displayName.
	gitRepository configAt: 'user.email' put: email.
