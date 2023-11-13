instance creation
nameFromURL: aString
	| url path name |
	url := Url absoluteFromText: aString.
	path := url path.
	path ifEmpty: [^ self requestUnregisteredName].
	name := self withoutGitSuffix: path last.
	(name isEmpty or: [self isNameRegistered: name])
		ifTrue: [^ self requestUnregisteredNameFrom: name].
	^ name