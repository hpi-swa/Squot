private
tableOfContents
	(directory / '_squot-table-of-contents') readStreamDo: [:stream |
		stream ascii.
		^ STON fromStreamWithComments: stream]
		ifAbsent: [ | notification |
			(notification := SquotNoTableOfContentsFound new)
				store: self;
				rootDirectory: directory;
				signal.
			^ notification artifacts]