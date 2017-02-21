writing
writeMethodDefinition: aMethodDefinition
	|path|
	
	path := self methodPathFor: aMethodDefinition.
	path parent ensureDirectory.
	
	path
		writeStreamDo: [ :s| 
			self writeMethodDefinition: aMethodDefinition on: s].