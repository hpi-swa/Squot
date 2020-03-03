helpers
setUpRepositoryObjects
	| blob commit tree |
	blob := GitBlob bytes: 'test' in: repository.
	blob store.
	tree := GitTree 
		entries: {
			GitTreeEntry
				fileNamed: 'testFile'
				hash: blob hash
				in: repository}
		in: repository.
	tree store.
	commit := [ [ GitCommit withDefaultStamps ]
		on: GitStampNameRequest
		do: [ :req | req resume: 'Homer Simpson' ] ]
			on: GitStampEmailRequest
			do: [ :req | req resume: 'homer@nuke.com' ].
	commit
		repository: repository;
		tree: tree;
		message: 'myCommit';
		store.
	repository updateRef: 'refs/heads/master' to: commit hexHash.