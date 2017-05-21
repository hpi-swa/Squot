accessing
extensions
	extensions ifNil: [fileStream reset. self readFrom: fileStream].
	^ extensions