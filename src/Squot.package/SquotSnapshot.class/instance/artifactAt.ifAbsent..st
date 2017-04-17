accessing
artifactAt: aPath ifAbsent: absentBlock
	^ artifacts at: aPath asString ifAbsent: absentBlock