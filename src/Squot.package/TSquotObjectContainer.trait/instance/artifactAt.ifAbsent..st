accessing objects
artifactAt: path ifAbsent: absentBlock
	^ self artifacts at: path ifAbsent: absentBlock