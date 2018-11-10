as yet unclassified
content: aByteArray

	"content := aByteArray."
	(self rootDirectory resolve: self path) writeStream binary nextPutAll: aByteArray