running
setUp
	| commit1 commit2  blob1 blob2 tree1 tree2 stamp |
	super setUp.
	stamp := GitStamp new
		name: 'Homer Simpson';
		email: 'homer@nuke.com';
		yourself.
	reference := (FileSystem memory / 'test.git').
	repository := GitRepository on: reference.

	repository withUnitOfWork: [
	blob1 := (GitBlob bytes: 'testBlob' in: repository) store; yourself.
	blob2 := (GitBlob bytes: 'second test Blob' in: repository) store; yourself.
	tree1 := GitTree 
		entries: {
			GitTreeEntry
				fileNamed: 'blob1'
				hash: blob1 hash
				in: repository}
		in: repository.
	tree1 store.
	tree2 := GitTree 
		entries: {
			GitTreeEntry
				fileNamed: 'blob2'
				hash: blob2 hash
				in: repository}
		in: repository.
	tree2 store.
	commit1 := (GitCommit in: repository)
		tree: tree1;
		message: 'message1';
		author: stamp;
		committer: stamp;
		store;
		yourself.
	commit2 := (GitCommit in: repository)
		tree: tree2;
		message: 'message2';
		author: stamp;
		committer: stamp;
		parents: { commit1 hexHash };
		store;
		yourself.
	
	repository unitOfWork
		updateRef: 'refs/heads/branch1' to: commit1 hexHash;
		updateRef: 'refs/heads/master' to: commit2 hexHash;
		updateRef: 'refs/heads/feature/x' to: commit2 hexHash;
		updateHeadToBranch: 'master']