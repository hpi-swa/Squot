accessing objects
artifactAt: path ifPresent: unaryBlock ifAbsent: absentBlock
	^ self artifacts at: path ifPresent: unaryBlock ifAbsent: absentBlock