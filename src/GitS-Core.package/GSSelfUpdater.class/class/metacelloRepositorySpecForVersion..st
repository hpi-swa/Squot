accessing
metacelloRepositorySpecForVersion: aString
	^ 'github://{1}:{2}/src' format: {self fullRepositoryName. aString}