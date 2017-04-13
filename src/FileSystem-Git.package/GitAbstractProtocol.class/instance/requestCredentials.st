private
requestCredentials
	credentials := (NeedGitCredentials for: url) signal.
	^ credentials notNil