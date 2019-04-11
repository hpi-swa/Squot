accessing
before

	| stream content |
	stream := (self parent leftReferenceOn: self path) readStream binary.
	content := stream contents.
	stream close.
	^ content