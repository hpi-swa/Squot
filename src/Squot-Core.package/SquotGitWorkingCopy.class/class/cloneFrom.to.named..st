instance creation
cloneFrom: aStringOrUrl to: anFSReference named: aString
	^ (self onFSReference: anFSReference named: aString)
		cloneFrom: aStringOrUrl;
		yourself