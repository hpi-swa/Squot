tests
testWritingSameCommitTwice
	| commit newRepository tree blob treeEntry |
	newRepository := GitRepository on: (FSFilesystem memory root).
	blob := GitBlob bytes: 'ablob' in: newRepository.
	treeEntry :=
		GitTreeEntry 
			fileNamed: 'theblob'
			hash: blob hash.
	tree := GitTree entries: { treeEntry } in: newRepository.
	commit := 
		GitCommit 
		withTree: tree 
		message: 'a commit'
		author: self defaultStamp
		committer: self defaultStamp.
	commit 
		repository: newRepository;
		store.
	newRepository updateRef: newRepository headsDir / 'master' to: commit hexHash.
	
	self shouldnt: [ commit store ] raise: Exception.