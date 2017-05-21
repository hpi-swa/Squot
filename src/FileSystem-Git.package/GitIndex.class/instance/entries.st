accessing
entries
	entries ifNil: [fileStream reset. self readFrom: fileStream].
	^ entries