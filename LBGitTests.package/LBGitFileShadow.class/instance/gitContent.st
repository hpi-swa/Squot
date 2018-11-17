as yet unclassified
gitContent

	^ self gitReference exists 
		ifTrue:  [self gitReference readStream binary contents]
		ifFalse: [nil]