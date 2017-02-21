tests
testCommitHash
	| entryHash treeEntry tree message commit commitDataSize |
	entryHash := (GitHash from: #[1 2 3 ]) hash.
	treeEntry :=
		GitTreeEntry
			fileNamed: 'file1' hash: entryHash in: nil.
	tree := GitTree entries: {treeEntry} in: nil.
	message := 'a message'.
	commit :=
		GitCommit
			withTree: tree
			message: message
			author: self defaultStamp
			committer: self defaultStamp
			in: nil.
	commitDataSize :=
		GitCommit typeCode size +
		1 + "space"
		commit byteData size asString size +
		1 + "null byte"
		commit byteData size.
	self assert: commit byteSignature size = commitDataSize