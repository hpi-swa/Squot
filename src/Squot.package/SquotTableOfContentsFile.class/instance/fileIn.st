reading
fileIn
	file readStreamDo: [:stream |
			stream ascii.
			collection := STON fromStreamWithComments: stream]
		ifAbsent: [ | notification |
			collection := OrderedDictionary new.
			(notification := SquotNoTableOfContentsFound new)
				tableOfContents: self;
				signal].