store
packagesInCurrentStore
	^ (self projectSelection store objectPaths
		select: [:each | each endsWith: '.package'])
			collect: [:each | (each copyAfterLast: $/) allButLast: ('.package' size)]