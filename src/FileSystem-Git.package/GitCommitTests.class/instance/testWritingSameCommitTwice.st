tests
testWritingSameCommitTwice
	| commit newRepository tree blob treeEntry |
	newRepository := GitRepository on: (FileSystem memory root).
	blob := GitBlob bytes: 'ablob' in: newRepository.
	treeEntry :=
		GitTreeEntry 
			fileNamed: 'theblob'
			hash: blob hash
			in: repository.
	tree := GitTree entries: { treeEntry } in: newRepository.
	commit := 
		GitCommit 
		withTree: tree 
		message: 'a commit'
		author: self defaultStamp
		committer: self defaultStamp
		in: newRepository.
	commit 
		store.
	newRepository updateRef: newRepository headsDir / 'master' to: commit hexHash.
	
	self shouldnt: [ commit store ] raise: Exception.