adding and removing
add: anObject at: aPath using: aSerializer
	"begin tracking anObject and have it accessible under aPath in a serialized form determined by aSerializer"
	"begin tracking anObject and have it accessible under aPath in a serialized form determined by anObject's default serializer"
	((objects includesKey: aPath) and: [(objects at: aPath) ~~ anObject])
		ifTrue: [Warning signal: 'About to overwrite another object in the store'].
	objects at: aPath put: anObject.
	(paths at: anObject ifAbsentPut: [Set new]) add: aPath.
	serializers at: aPath put: aSerializer.