registering
register: aWorkingCopy
	| name |
	name := aWorkingCopy name.
	(self isNameRegistered: name) ifTrue: [
		^ self error: ('A project with the name ''{1}'' is already registered.' format: {name})].
	self registry at: name put: aWorkingCopy.
	self changed: #registry.