requests
initialPathRequestAnswerWithSuffix: aStringOrPath
	^ SquotPathUtilities asString:
		(self commonPathPrefix resolve: (aStringOrPath ifNil: [FSPath workingDirectory]))