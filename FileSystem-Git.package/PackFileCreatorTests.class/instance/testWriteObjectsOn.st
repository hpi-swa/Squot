tests
testWriteObjectsOn
	| blob creator file contents reference repository bytesRead |
	reference := FileSystem memory root / 'repo'.
	repository := GitRepository on: reference.
	blob := GitBlob bytes: 'my blob with size greater than 32' in: repository.
	blob store.
	creator := GitPackFileCreator new
		repository: repository;
		yourself.
	file := FileSystem memory root / 'afile'.
	file writeStreamDo: [ :stream | creator on: stream ].
	contents := file readStreamDo: [ :stream | stream contents ].
	contents := contents allButFirst: 2.	"ignore header"
	self assert: contents size equals: blob compressedForPack size.
	self shouldnt: [ bytesRead := (ZLibReadStream on: contents) contents ] raise: Error.
	self assert: bytesRead equals: blob byteData