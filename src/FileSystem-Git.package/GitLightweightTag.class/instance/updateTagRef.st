storing
updateTagRef
	self repository 
		updateRef: 'refs/tags/', self name
		to: self object hexHash