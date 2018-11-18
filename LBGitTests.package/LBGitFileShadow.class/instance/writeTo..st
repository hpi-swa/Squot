as yet unclassified
writeTo: aStream

	self halt.
	aStream nextPutAll: self content.