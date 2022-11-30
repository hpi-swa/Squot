accessing
message: aString
	message := aString.
	save ifNotNil: [save message: aString].