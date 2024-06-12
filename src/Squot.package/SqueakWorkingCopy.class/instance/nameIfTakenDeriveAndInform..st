accessing
nameIfTakenDeriveAndInform: aString
	self name: aString ifTakenDeriveAnd: [:derived |
		self inform: ('The project name {1} is already taken. The project has been renamed to {2}.'
						format: {aString printString. derived printString})].