instance creation
path: aPath writerClass: anImageReadWriterClass
	^ self new
		path: aPath;
		writerClass: anImageReadWriterClass;
		yourself