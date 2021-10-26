reflection
reflectElement: aCollectionElement of: aDictionaryShadow put: anObject
	aCollectionElement target: anObject.
	aDictionaryShadow atElement: aCollectionElement put: anObject.
	^ anObject