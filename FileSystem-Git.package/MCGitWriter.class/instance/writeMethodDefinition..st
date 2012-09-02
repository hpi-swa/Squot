writing
writeMethodDefinition: aMethodDefinition
	|path|
	
	path := self methodPathFor: aMethodDefinition.
	path ensureDirectory.
	
	(path / aMethodDefinition selector, 'st')
		writeStreamDo: [ :s| 
			self writeMethodDefinition: aMethodDefinition on: s].