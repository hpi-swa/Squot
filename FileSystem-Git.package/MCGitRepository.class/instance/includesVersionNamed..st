interface
includesVersionNamed: aString
	self flag: '(aString copyUpToLast: $.)'.
	^ self repository tagNames includes: aString.