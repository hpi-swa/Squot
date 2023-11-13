instance creation
requestUnregisteredNameFrom: aString
	| name |
	name := UIManager default request: 'Project name:' initialAnswer: aString.
	name isEmptyOrNil ifTrue: [^ nil].
	(self isNameRegistered: name) ifTrue: [
		self inform: 'A project with that name is already registered, pick another.'.
		^ self requestUnregisteredNameFrom: name].
	^ name