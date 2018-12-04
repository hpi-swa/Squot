applying
createFile: aPath

	| sourceReference targetReference inputStream content |
	sourceReference := self sourceReferenceOn: aPath.
	sourceReference exists ifFalse: [^ self].
	targetReference := self targetReferenceOn: aPath.
	self flag: #TODO. "Do ensure the file does NOT exist workingReference ensureFile."
	"sourceReference copyTo: targetReference."
	inputStream := sourceReference readStream binary.
	content := inputStream contents.
	inputStream close.
	targetReference writeStream binary nextPutAll: content; close.
	"targetReference fileSystem copyFrom: inputStream to: targetReference path.
	inputStream close."