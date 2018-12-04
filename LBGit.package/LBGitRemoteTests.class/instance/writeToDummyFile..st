dummy file
writeToDummyFile: anObject

	(self reference resolve: self dummyFile) writeStream binary
		nextPutAll: anObject asByteArray;
		close.