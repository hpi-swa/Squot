accessing
branches
	^ self unitOfWork branches collect: [ :commit | 
		self filesystemOn: commit ]