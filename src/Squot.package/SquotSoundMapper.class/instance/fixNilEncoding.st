migrations
fixNilEncoding
	| extension |
	self encoding ifNotNil: [^ self].
	extension := self path extension asLowercase.
	self encoding:
		(self class validEncodings
			detect: [:each | each asLowercase = extension]
			ifNone: [self class defaultEncoding])