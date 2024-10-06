instance creation
requestUnregisteredNameFrom: aString title: anotherString
	| name |
	name := UIManager default request: anotherString initialAnswer: aString.
	name isEmptyOrNil ifTrue: [^ nil].
	(self isNameRegistered: name) ifTrue: [
		self inform: 'A project with that name is already registered, pick another.'.
		^ self requestUnregisteredNameFrom: name title: anotherString].
	^ name