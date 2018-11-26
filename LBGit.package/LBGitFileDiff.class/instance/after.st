accessing
after

	| stream content |
	stream := (self parent rightReferenceOn: self path) readStream binary.
	content := stream contents.
	stream close.
	^ content