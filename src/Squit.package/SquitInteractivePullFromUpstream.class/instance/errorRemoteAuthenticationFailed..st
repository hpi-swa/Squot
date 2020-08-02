private
errorRemoteAuthenticationFailed: aGitRemoteError
	| message answer |
	message := 'Authentication with the remote failed for some reason.'.
	aGitRemoteError responseBody ifNotEmpty: [
		message := message , String cr , 
			'The following might give a hint of what has happened:' , String cr , String cr, 
			aGitRemoteError responseBody , String cr].
	(aGitRemoteError remote url includesSubstring: 'github.com')
		ifTrue: [message := message, String cr , 'Also please note: If you have two-factor authentification enabled,'
			, String cr, 'you must use a personal access token instead of your GitHub login password.'].
	(answer := SquotGUI confirm: message trueChoice: 'Retry' translated falseChoice: 'Debug')
		= false ifTrue: [ToolSet handleError: aGitRemoteError].
	^ answer