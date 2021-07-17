reflection
reflectElement: aCollectionElement of: aHashedCollectionShadow put: anObject
	aCollectionElement target: anObject.
	aHashedCollectionShadow atElement: aCollectionElement put: anObject.
	^ anObject