printing
printOn: aStream
	artifacts
		ifEmpty: [aStream nextPutAll: 'SquotSnapshot empty']
		ifNotEmpty: [super printOn: aStream].