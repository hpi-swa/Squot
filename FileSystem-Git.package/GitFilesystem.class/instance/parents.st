delegating
parents
	^ store parents collect: [ :commit | 
		repository filesystemOn: commit ]