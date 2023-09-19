instance creation
requestUnregisteredName
	| name |
	name := UIManager default request: 'Project name:'.
	name isEmptyOrNil ifTrue: [^ nil].
	(self isNameRegistered: name) ifTrue: [
		self inform: 'A project with that name is already registered, pick another.'.
		^ self requestUnregisteredName].
	^ name