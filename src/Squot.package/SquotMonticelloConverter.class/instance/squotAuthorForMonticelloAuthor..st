private accessing
squotAuthorForMonticelloAuthor: aString

	^ (self authorMap ifNil: [^ aString]) at: aString