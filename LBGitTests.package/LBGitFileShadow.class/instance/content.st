as yet unclassified
content

	self shouldNotImplement.
	^ self reference exists 
		ifTrue:  [| stream content |
			stream := self reference readStream binary.
			content := stream contents.
			stream close.
			content]
		ifFalse: [nil]