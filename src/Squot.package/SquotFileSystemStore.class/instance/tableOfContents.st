private
tableOfContents
	(directory / self class tocFileName) readStreamDo: [:stream |
		stream ascii.
		^ STON fromStreamWithComments: stream]
		ifAbsent: [ | notification |
			(notification := SquotNoTableOfContentsFound new)
				store: self;
				rootDirectory: directory;
				signal.
			^ notification tableOfContents]