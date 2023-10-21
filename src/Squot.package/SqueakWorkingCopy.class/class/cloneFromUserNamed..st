instance creation
cloneFromUserNamed: aString
	| url reference |
	url := UIManager default request: 'URL to clone:'.
	url isEmptyOrNil ifTrue: [^ nil].
	reference := (self requestFSReferenceForName: aString) ifNil: [^ nil].
	^ self cloneFrom: url to: reference named: aString