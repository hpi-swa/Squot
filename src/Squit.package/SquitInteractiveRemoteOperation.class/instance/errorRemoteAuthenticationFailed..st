error handling
errorRemoteAuthenticationFailed: aGitRemoteError
	| message answer |
	message := 'Authentication with the remote failed for some reason.'.
	aGitRemoteError responseBody ifNotEmpty: [
		message := message , String cr , 
			'The following might give a hint of what has happened:' , String cr , String cr, 
			aGitRemoteError responseBody asString asTextFromHtml, String cr].
	(aGitRemoteError remote url includesSubstring: 'github.com')
		ifTrue: [message := message, String cr , 'Also please note: If you have two-factor authentification enabled,'
			, String cr, 'you must use a personal access token instead of your GitHub login password.'].
	answer := SquotGUI
		chooseFrom:
			{'Retry' translated. 'Change credentials' translated. 'Cancel' translated. 'Debug'} 
		values: #(retry dropCredentials cancel debug)
		title: message.
	answer caseOf:
		{[#retry] -> [aGitRemoteError retry].
		[#dropCredentials] ->
			[self repository removeCredentialsFor: aGitRemoteError remote url.
			aGitRemoteError retry "will signal NeedGitCredentials"].
		[#cancel] -> [^ nil].
		[nil] "Dialog closed" -> [^ nil].
		[#debug] -> [ToolSet handleError: aGitRemoteError]}.
	^ answer