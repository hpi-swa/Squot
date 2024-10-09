requests
initialPathRequestAnswerWithSuffix: aStringOrPath
	^ GSPathUtilities asString:
		(self commonPathPrefix resolve: (aStringOrPath ifNil: [FSPath workingDirectory]))