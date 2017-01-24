adding and removing
add: anObject at: aPath using: aSerializer
	"begin tracking anObject and have it accessible under aPath in a serialized form determined by aSerializer"
	| pathString |
	pathString := aPath asString.
	((objects includesKey: pathString) and: [(objects at: pathString) ~~ anObject])
		ifTrue: [Warning signal: 'About to overwrite another object in the store'].
	objects at: pathString put: anObject.
	(paths at: anObject ifAbsentPut: [Set new]) add: pathString.
	serializers at: pathString put: aSerializer.