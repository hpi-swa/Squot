instance creation
withMapper: aMapper from: aString to: anotherString
	^ (self withMapper: aMapper)
		setChangeFrom: aString to: anotherString;
		yourself