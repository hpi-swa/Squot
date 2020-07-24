private
errorRemoteResourceNotFound: aGitRemoteError
	| message response |
	message := 'No repository found at the remote URL. Maybe the URL is incorrect.'.
	aGitRemoteError responseBody ifNotEmpty: [
		message := message , String cr , 
			'The following might give a hint of what has happened:' , String cr , String cr, 
			(aGitRemoteError responseBody contractTo: 200), String cr].
	response := SquotGUI confirm: message trueChoice: 'OK' translated falseChoice: 'Debug'.
	response ifNil: [^ self cancel].
	response
		ifTrue: [promise rejectWith: aGitRemoteError]
		ifFalse: [ToolSet handleError: aGitRemoteError].