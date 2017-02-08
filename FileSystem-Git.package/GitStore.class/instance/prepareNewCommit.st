git plumbing
prepareNewCommit
	| commit parents |
	modManager processChanges.
	commit := GitCommit new
		tree: modManager rootTree;
		author: GitStamp now;
		committer: GitStamp now;
		repository: repository;
		yourself.
	parents := OrderedCollection new.
	revision ifNotNil: [ parents add: revision hexHash ].
	commit parents: parents.
	^ commit