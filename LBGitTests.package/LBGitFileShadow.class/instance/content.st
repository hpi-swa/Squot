as yet unclassified
content

	^ self reference exists 
		ifTrue:  [self reference readStream binary contents]
		ifFalse: [nil]