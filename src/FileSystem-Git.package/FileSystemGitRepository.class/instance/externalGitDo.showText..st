git porcelain
externalGitDo: aCommandLineSuffix showText: aBoolean
	(Smalltalk classNamed: #OSProcess)
		ifNotNil: [:osProcess | | pipeline err out |
			pipeline := osProcess evaluate: ('git -C {1} {2}' format: {repository workingDir. aCommandLineSuffix}).
			out := pipeline upToEndOfFile.
			err := pipeline errorUpToEndOfFile.
			pipeline waitForAllToComplete.
			pipeline last exitCode = 0
				ifFalse: [self notify: out, String cr, err]
				ifTrue: [aBoolean ifTrue: [self inform: out, err] ifFalse: [Transcript showln: out, err]]]
		ifNil: [self error: 'For external commands, OSProcess must be installed']