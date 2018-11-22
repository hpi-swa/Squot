as yet unclassified
gitContent

	| stream content |
	^ self gitReference exists 
		ifFalse: [nil]
		ifTrue: 
	[stream := self gitReference readStream binary.
	content := stream contents.
	stream close.
	^ content]
