instance creation
nameFromURL: aString
	| url path name |
	url := Url absoluteFromText: aString.
	path := url path.
	path ifEmpty: [^ self requestUnregisteredName].
	name := (path
				reversed
				collect: [:each | self withoutGitSuffix: each])
				detect: #notEmpty ifNone: [''].
	(name isEmpty or: [self isNameRegistered: name])
		ifTrue: [^ self requestUnregisteredNameFrom: name].
	^ name