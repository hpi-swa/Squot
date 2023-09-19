instance creation
cloneFromUserNamed: aString
	| url reference |
	url := UIManager default request: 'URL to clone:'.
	url isEmptyOrNil ifTrue: [^ nil].
	reference := self requestFSReference ifNil: [^ nil].
	^ self cloneFrom: url to: reference named: aString