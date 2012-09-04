testing
canDecode: aString
	^ self isAbstract not 
		and: [ aString = self typeCode ]