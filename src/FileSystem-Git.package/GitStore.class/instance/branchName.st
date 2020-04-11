git-delegating
branchName
	| fullRef git |
	git := self unitOfWork.
	fullRef := revision
		ifNil: [git followSymbolicRefs: 'HEAD']
		ifNotNil: [git refTo: revision].
	^ git nameOf: fullRef in: 'refs/heads/'