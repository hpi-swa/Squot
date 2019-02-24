accessing
credentials

	^ {(SmalltalkCI getEnv: 'GITUSERNAME') ifNil: [NeedGitCredentials new signal].
	(SmalltalkCI getEnv: 'GITPASSWORD') ifNil: [NeedGitCredentials new signal]}