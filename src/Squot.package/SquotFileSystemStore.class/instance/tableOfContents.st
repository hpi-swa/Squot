private
tableOfContents
	(directory / '_squot-table-of-contents') readStreamDo: [:stream |
		stream ascii.
		^ STON fromStreamWithComments: stream]
		ifAbsent: [^ Dictionary new]