toolbuilder
project: aString
	aString ifNil: [^ self workingCopy: nil].
	self workingCopy: (SqueakWorkingCopy named: aString).