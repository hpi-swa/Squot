as yet unclassified
contents

	| stream content |
	^ (self path notNil and: [self path exists]) 
		ifFalse: [nil]
		ifTrue: 
			[stream := self path readStream binary.
			content := stream contents.
			stream close.
			content]
