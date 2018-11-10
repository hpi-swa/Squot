as yet unclassified
content: aByteArray

	"content := aByteArray."
	(FileStream fileNamed: self path) readWrite binary nextPutAll: aByteArray