git-delegating
branchName
	| fullRef |
	fullRef := revision
		ifNil: [repository followSymbolicRefs: 'HEAD']
		ifNotNil: [repository refTo: revision].
	^ repository nameOf: fullRef in: 'refs/heads/'