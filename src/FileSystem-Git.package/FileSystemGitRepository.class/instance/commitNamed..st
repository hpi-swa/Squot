accessing
commitNamed: hexHash
	^ self filesystemOn: (repository objectNamed: hexHash)