storing
updateTagRef
	self currentUnitOfWork 
		updateRef: 'refs/tags/', self name
		to: self object hexHash