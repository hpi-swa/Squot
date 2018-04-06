store
packagesIn: aWorkingCopy
	^ (aWorkingCopy store objectPaths
		select: [:each | each endsWith: '.package'])
		collect: [:each | each squotPathSegments last allButLast: '.package' size]