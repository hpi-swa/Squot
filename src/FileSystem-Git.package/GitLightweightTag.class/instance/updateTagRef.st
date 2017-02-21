storing
updateTagRef
	self repository 
		updateRef: self repository tagsDir / self name 
		to: self object hexHash