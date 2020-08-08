accessing
commitNamed: hexHash
	| git |
	git := GitCurrentUnitOfWork for: repository.
	^ self filesystemOn: (git objectNamed: hexHash)