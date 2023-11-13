instance creation
cloneFromUserAndRegister
	| url name reference |
	url := UIManager default request: 'URL to clone:'.
	url isEmptyOrNil ifTrue: [^ nil].
	name := (self nameFromURL: url) ifNil: [^ nil].
	reference := (self requestFSReferenceForName: name) ifNil: [^ nil].
	^ (self cloneFrom: url to: reference named: name)
		register;
		yourself