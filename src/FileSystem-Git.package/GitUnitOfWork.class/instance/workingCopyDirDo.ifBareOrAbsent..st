accessing
workingCopyDirDo: aBlock ifBareOrAbsent: absentBlock
	^ self workingCopyDirDo: [:workingCopyDir |
			workingCopyDir isDirectory ifFalse: [^ absentBlock value].
			aBlock value: workingCopyDir]
		ifBare: [absentBlock value]