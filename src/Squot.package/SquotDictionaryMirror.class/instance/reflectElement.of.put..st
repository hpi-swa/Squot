reflection
reflectElement: aSquotCollectionElement of: aDictionary put: anAssociation
	aSquotCollectionElement target: anAssociation.
	^ aDictionary add: anAssociation