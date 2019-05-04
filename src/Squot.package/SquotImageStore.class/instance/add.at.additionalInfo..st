adding and removing
add: anObject at: aPath additionalInfo: trackedObjectMetadata
	"Begin tracking anObject and have it accessible under aPath. 
	Remember the additional information in aDictionary about the object (serialization info etc.)."
	| pathString |
	pathString := aPath asString.
	((objects includesKey: pathString) and: [(objects at: pathString) ~~ anObject])
		ifTrue: [Warning signal: 'About to overwrite another object in the store'].
	objects at: pathString put: anObject.
	(paths at: anObject ifAbsentPut: [Set new]) add: pathString.
	additionalInfo at: pathString put: trackedObjectMetadata.
	self appendToLoadOrder: pathString.
	^ pathString