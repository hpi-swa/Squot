git porcelain - external
externalGitDo: aCommandLineSuffix showText: aBoolean
	| res |
	res := self externalCommand: ('git -C {1} {2}' format: {repository workingDir. aCommandLineSuffix}).
	res first
		ifFalse: [self error: res second]
		ifTrue: [aBoolean ifTrue: [self inform: res second] ifFalse: [Transcript showln: res second]]