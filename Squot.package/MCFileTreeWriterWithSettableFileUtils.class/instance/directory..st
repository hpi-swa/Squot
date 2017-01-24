accessing
directory: aDirectoryReference
	"if writeVersion: is not used"
	directory := aDirectoryReference.
	packageFileDirectory := nil. "will be repopulated lazily"