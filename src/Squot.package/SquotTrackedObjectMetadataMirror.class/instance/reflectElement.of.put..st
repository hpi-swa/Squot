reflection
reflectElement: aSquotCollectionElement of: aDictionary put: anAssociation
	"Never share associations."
	^ aDictionary at: anAssociation key put: anAssociation value