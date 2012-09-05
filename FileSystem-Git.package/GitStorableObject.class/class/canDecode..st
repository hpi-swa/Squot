testing
canDecode: anObject
	^ self isAbstract not 
		and: [ anObject = self typeCode
		or: [ anObject = self byteTypeCode ] ]