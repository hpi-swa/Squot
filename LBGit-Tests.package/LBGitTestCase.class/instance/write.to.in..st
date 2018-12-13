actions
write: anObject to: aString in: aReference

	(aReference resolve: aString) writeStream binary
		nextPutAll: anObject asByteArray;
		close.