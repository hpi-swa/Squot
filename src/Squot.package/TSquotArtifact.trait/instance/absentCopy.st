copying
absentCopy
	^ (SquotAbsentArtifact newFrom: self)
		postCopyWithoutContent;
		content: nil;
		yourself