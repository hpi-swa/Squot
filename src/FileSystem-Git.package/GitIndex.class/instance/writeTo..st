writing
writeTo: aStream
	| hash |
	aStream nextPutAll: 'DIRC' asByteArray. "magic number"
	aStream nextInt32Put: version.
	aStream nextInt32Put: entries size.
	entries do: [:each | self writeEntry: each to: aStream].
	extensions do: [:each | self writeExtension: each to: aStream].
	hash := GitHash from: aStream contents.
	aStream nextPutAll: hash byteHash.