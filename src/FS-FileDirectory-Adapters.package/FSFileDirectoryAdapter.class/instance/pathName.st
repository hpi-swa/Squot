path access
pathName
	| string |
	string := reference pathString.
	^ (string endsWith: '/')
		ifTrue: [string allButLast]
		ifFalse: [string]