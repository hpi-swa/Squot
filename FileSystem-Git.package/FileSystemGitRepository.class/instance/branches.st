accessing
branches
	^ repository branches collect: [ :commit | 
		self filesystemOn: commit ]