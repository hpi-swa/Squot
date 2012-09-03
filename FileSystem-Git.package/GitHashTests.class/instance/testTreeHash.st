tests
testTreeHash
	| hash1 hash2 entry1 entry2 tree dataSize1 dataSize2 stream treeDataSize treeHash |
	hash1 := SecureHashAlgorithm new hashMessage: #[1 2 3].
	hash2 := SecureHashAlgorithm new hashMessage: #[4 5 6 7].
	treeHash := #[83 30 221 175 161 242 190 210 135 98 78 1 20 103 113 251 149 188 122 146].
	entry1 := 
		GitTreeEntry
			directoryNamed: 'dir1' hash: hash1 in: nil.
	entry2 :=
		GitTreeEntry
			fileNamed: 'file1' hash: hash2 in: nil.
	tree := GitTree entries: {entry1. entry2} in: nil.
	dataSize1 := 
		(GitTreeEntry printMode: GitTreeEntry dirMode) size +
		1 + "space"
		'dir1' size +
		1 + "null byte"
		hash1 size.
	dataSize2 := 
		(GitTreeEntry printMode: GitTreeEntry fileMode) size +
		1 + "space"
		'file1' size +
		1 + "null byte"
		hash2 size.
	stream := GitStream new.
	entry1 storeOn: stream.
	self assert: stream contents size = dataSize1.
	stream := GitStream new.
	entry2 storeOn: stream.
	self assert: stream contents size = dataSize2.
	treeDataSize :=
		GitTree typeCode size +
		1 + "space"
		(dataSize1 + dataSize2) asString size +
		1 + "null byte"
		dataSize1 +
		dataSize2.
	self assert: tree byteSignature size = treeDataSize.
	self assert: tree hash asByteHash = treeHash
	