accessing
commitIfNilInformAnd: aBlock
	^ self commit ifNil: [
		self inform: ('Unknown label {1}. Please fix and try again.'
						format: {self label printString}).
		aBlock value: (self afterContinue: [self retry])]