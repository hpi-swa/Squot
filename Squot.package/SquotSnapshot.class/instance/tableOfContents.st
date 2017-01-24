as yet unclassified
tableOfContents
	(directory / '.squot-table-of-contents') readStreamDo: [:stream |
		stream ascii.
		^ STON fromStreamWithComments: stream]