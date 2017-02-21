private
tableOfContents
	(directory / '.squot-table-of-contents') readStreamDo: [:stream |
		stream ascii.
		^ STON fromStreamWithComments: stream]
		ifAbsent: [^ Dictionary new]