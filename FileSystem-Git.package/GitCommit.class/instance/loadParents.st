loading
loadParents
	^ self basicParents collect: [ :parentHash |
		self repository objectNamed: parentHash ]