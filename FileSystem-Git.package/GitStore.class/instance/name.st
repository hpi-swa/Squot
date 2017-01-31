git-delegating
name
"Answers the sha1 name of the currently active commit (the checked out version of the repository)."

	^ modManager hasModifications
		ifTrue: [ '' ]
		ifFalse: [ revision
			ifNotNil: [ revision hexHash ]
			ifNil: [ '' ]]