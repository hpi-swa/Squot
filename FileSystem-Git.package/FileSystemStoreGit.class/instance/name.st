git-delegating
name
"Answers the sha1 name of the currently active commit (the checked out version of the repository)."

	^ revision
		ifNotNil: [ revision signature hexHash ]
		ifNil: [ '' ]