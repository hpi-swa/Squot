instance creation
path: aPath writerClass: anImageReadWriterClass
	^ (self path: aPath)
		writerClass: anImageReadWriterClass;
		yourself