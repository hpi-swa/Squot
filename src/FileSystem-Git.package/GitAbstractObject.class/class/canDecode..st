testing
canDecode: anObject
	^ self isAbstract not 
		and: [ anObject = self byteTypeCode ] 