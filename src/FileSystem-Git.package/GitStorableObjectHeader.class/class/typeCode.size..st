instance creation
typeCode: typeCode size: sizeInteger
	^ self new
		typeCode: typeCode;
		objectSize: sizeInteger;
		yourself