as yet unclassified
contents

	| stream content |
	^ (self reference notNil and: [self reference exists]) 
		ifFalse: [nil]
		ifTrue: 
			[stream := self reference readStream binary.
			content := stream contents.
			stream close.
			content]
