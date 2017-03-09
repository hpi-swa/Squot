operations
shouldTreatFileAsBinary: aFileStream at: path
	self flag: #gitattributes.
	^ (self probeStreamForNullBytes: aFileStream) or: [(self shouldFilterLineEndings: path) not]