tests
testWriteObjectsOn
	| blob file contents bytesRead |
	blob := GitBlob bytes: 'my blob with size greater than 32' in: repository.
	blob store.
	creator := GitPackFileCreator new
		repository: repository;
		instVarNamed: 'orderedHashes' put: (OrderedCollection with: blob hash);
		instVarNamed: 'hashDict' put: (Dictionary with: blob hash -> 21);
		yourself.
	file := FileSystem memory root / 'afile'.
	file writeStreamDo: [ :stream | creator writeObjectsOn: stream ].
	contents := file readStreamDo: [ :stream | stream contents ].
	contents := contents allButFirst: 2.	"ignore header"
	self assert: contents size equals: blob compressedForPack size.
	self shouldnt: [ bytesRead := (GitZLibReadStream on: contents) contents ] raise: Error.
	self assert: bytesRead equals: blob byteData