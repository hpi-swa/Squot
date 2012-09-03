running
setUp
	| commit1 commit2  blob1 blob2 tree1 tree2 stamp |
	super setUp.
	stamp := GitStamp new
		name: 'Homer Simpson';
		email: 'homer@nuke.com';
		yourself.
	reference := (FileSystem memory / 'test.git').
	basicRepository := GitRepository on: reference.

	blob1 := (GitBlob bytes: 'testBlob' in: basicRepository) store; yourself.
	blob2 := (GitBlob bytes: 'second test Blob' in: basicRepository) store; yourself.
	tree1 := GitTree 
		entries: {
			GitTreeEntry
				fileNamed: 'blob1'
				hash: blob1 hash}
		in: basicRepository.
	tree1 store.
	tree2 := GitTree 
		entries: {
			GitTreeEntry
				fileNamed: 'blob2'
				hash: blob2 hash}
		in: basicRepository.
	tree2 store.
	commit1 := (GitCommit in: basicRepository)
		tree: tree1;
		message: 'message1';
		author: stamp;
		committer: stamp;
		store;
		yourself.
	commit2 := (GitCommit in: basicRepository)
		tree: tree2;
		message: 'message2';
		author: stamp;
		committer: stamp;
		parents: { commit1 hexHash };
		store;
		yourself.
	
	basicRepository
		updateRef: basicRepository headsDir / 'branch1' to: commit1 hexHash;
		updateRef: basicRepository headsDir / 'master' to: commit2 hexHash.
		
	repository := FileSystemGitRepository on: reference.