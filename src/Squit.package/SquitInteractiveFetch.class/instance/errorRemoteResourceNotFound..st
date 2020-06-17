private
errorRemoteResourceNotFound: aGitRemoteError
	| message response |
	message := 'No repository found at the remote URL. Maybe the URL is incorrect.'.
	aGitRemoteError responseBody ifNotEmpty: [
		message := message , String cr , 
			'The following might give a hint of what has happened:' , String cr , String cr, 
			(aGitRemoteError responseBody contractTo: 200), String cr].
	response := UIManager default confirm: message trueChoice: 'OK' translated falseChoice: 'Debug'.
	response = false ifTrue: [ToolSet handleError: aGitRemoteError].
	response ifNil: [self cancel].