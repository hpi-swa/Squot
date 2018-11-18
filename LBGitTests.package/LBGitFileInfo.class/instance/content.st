as yet unclassified
content

	| stream content |
	stream := self reference readStream binary.
	content := stream contents.
	stream close.
	^ content