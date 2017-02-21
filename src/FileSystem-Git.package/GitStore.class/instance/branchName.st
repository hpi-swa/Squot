git-delegating
branchName
	| fullRef |
	fullRef := revision
		ifNil: [repository followSymbolicRef: repository headFile]
		ifNotNil: [repository refTo: revision].
	^ repository nameOf: fullRef in: 'refs/heads/'