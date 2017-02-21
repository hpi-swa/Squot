writing
writeClassDefinition: aClassDefinition 
	| classPath |
	
	classPath := self classPathFor: aClassDefinition.
	
	((classPath / 'instance-side') ensureDirectory / 'definition.st') writeStreamDo: [ :s|
		self writeClassDefinition: aClassDefinition on: s].
	
	((classPath / 'class-side') ensureDirectory / 'definition.st') writeStreamDo: [ :s|
		self writeMetaClassDefinition: aClassDefinition on: s].
	
	(classPath / 'README.txt') writeStreamDo: [ :s|
		s nextPutAll: (self convert: aClassDefinition comment)].
	