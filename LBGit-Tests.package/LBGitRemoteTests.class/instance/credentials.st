accessing
credentials

	^ {SmalltalkCI getEnv: 'GITUSERNAME'.
	SmalltalkCI getEnv: 'GITPASSWORD'}