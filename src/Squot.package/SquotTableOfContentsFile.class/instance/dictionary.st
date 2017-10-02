accessing
dictionary
	^ collection ifNil:
		[collection := file readStreamDo: [:stream |
				stream ascii.
				STON fromStreamWithComments: stream]
			ifAbsent: [ | notification |
				(notification := SquotNoTableOfContentsFound new)
					rootDirectory: file parent;
					signal.
				notification tableOfContents]]