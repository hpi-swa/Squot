private accessing
squotAuthorForMonticelloAuthor: aString

	^ (self authorMap ifNil: [^ aString]) at: aString ifAbsent: [
		(KeyNotFound key: aString) signal: 'key is not in author map']