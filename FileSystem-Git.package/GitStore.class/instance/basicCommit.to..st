internal
basicCommit: aMessage to: branchName
	| commit parents author committer |
	"Disallow empty commits"
	modManager hasModifications ifFalse: [ ^ self ].
	modManager processChanges.
	
	commit := GitCommit
		withTree: modManager rootTree
		message: aMessage
		author: (author ifNil: [ author := GitStamp now ])
		committer: (committer ifNil: [ committer := GitStamp now ]).
		
	parents := OrderedCollection new.
	revision ifNotNil: [ parents add: revision hash ].
	commit 
		parents: parents;
		repository: repository;
		store.
	
	repository 
		updateRef: repository headsDir / branchName 
		to: commit hexHash.
	self 
		basicReset;
		revision: commit.