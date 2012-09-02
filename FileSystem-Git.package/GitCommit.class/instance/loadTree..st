loading
loadTree: aHexHash
	self tree: (self repository objectNamed: aHexHash)
	