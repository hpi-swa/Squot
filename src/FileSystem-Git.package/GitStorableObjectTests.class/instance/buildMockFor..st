helpers
buildMockFor: aGitObjectClass
	| tree fakeName |
	fakeName := (GitBlob bytes: 'test' in: repository) hash.
	tree := GitTree 
		entries: {
			GitTreeEntry 
				fileNamed: 'testFile' 
				hash: fakeName
				in: repository}
		in: repository.
	aGitObjectClass = GitBlob
		ifTrue: [ ^ GitBlob bytes: 'test' in: repository ].
	aGitObjectClass = GitCommit
		ifTrue: [ 
			^ (GitCommit in: repository)
				author: self defaultStamp;
				committer: self defaultStamp;
				tree: tree;
				message: 'initial commit';
				yourself ].
	aGitObjectClass = GitTag
		ifTrue: [ 
			^ GitTag
				named: 'testTag'
				for: ((self buildMockFor: GitCommit) store; yourself)
				message: 'aMessage'
				tagger: self defaultStamp
				in: repository ].
	aGitObjectClass = GitTree
		ifTrue: [ ^ GitTree entries: {(GitTreeEntry fileNamed: 'testFile' hash: fakeName in: repository)} in: repository ].
	self error: 'the class you provided needs to be instantiated to test #loadFrom:. Add a new entry to #buildMockFor:'