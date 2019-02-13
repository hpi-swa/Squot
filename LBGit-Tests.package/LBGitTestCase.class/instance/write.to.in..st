actions
write: anObject to: aString in: aReference

	| file |
	file := (aReference resolve: aString).
	file parent ensureDirectory.
	file writeStream binary
		nextPutAll: anObject asByteArray;
		close.