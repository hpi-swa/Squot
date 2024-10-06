toolbuilder
project: aString
	SqueakWorkingCopy registry ifEmpty: [^ self].
	aString ifNil: [^ self workingCopy: nil].
	self workingCopy: (SqueakWorkingCopy named: aString).