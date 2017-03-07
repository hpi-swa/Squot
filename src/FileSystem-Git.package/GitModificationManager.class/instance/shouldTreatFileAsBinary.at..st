operations
shouldTreatFileAsBinary: aFileStream at: path
	^ (self shouldFilterLineEndings: path) not