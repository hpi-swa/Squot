running
setUp
	| repoRef repo commit1 commit2 tree blob |
	super setUp.
	repoRef := FSFilesystem memory / 'testRepo'.
	repo := GitRepository on: repoRef.
	blob := (GitBlob bytes: 'blob1' in: repo) store; yourself.
	tree := GitTree 
		entries: {
			GitTreeEntry
				fileNamed: 'first blob'
				hash: blob hash }
		in: repo.
	tree store.
	commit1 := GitCommit 
		withTree: tree
		message: 'first commit'
		author: GitStamp now
		committer: GitStamp now.
	commit1 store.
	repo updateRef: repo headsDir / 'branch1' to: commit1 signature.
	
	blob := (GitBlob bytes: 'blob2' in: repo) store; yourself.
	tree := GitTree 
		entries: {
			GitTreeEntry
				fileNamed: 'second blob'
				hash: blob signature }
		in: repo.
	tree store.
	commit2 := GitCommit
		withTree: tree
		message: 'second commit'
		author: GitStamp now
		committer: GitStamp now.
	commit2 parents: { commit1 }.
	commit2 store.
	repo updateRef: repo headsDir / 'master' to: commit2 signature.
		
	basicRepository := repo.
	repository := FileSystemGitRepository on: repoRef