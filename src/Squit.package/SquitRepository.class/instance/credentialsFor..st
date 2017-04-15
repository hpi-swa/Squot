synchronizing
credentialsFor: repositoryUrl
	^ credentials at: repositoryUrl asString ifAbsent: []