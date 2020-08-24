accessing
commitNamed: hexHash
	| git |
	git := repository unitOfWork.
	^ self filesystemOn: (git objectNamed: hexHash)