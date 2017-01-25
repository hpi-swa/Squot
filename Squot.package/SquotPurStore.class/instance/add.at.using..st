adding and removing
add: anObject at: aPath using: aSerializer
	"Begin tracking anObject and have it accessible under aPath in a serialized form
	determined by aSerializer. The serializer can also change the path if a specific format
	is required. Therefore, answer the eventual path."
	| pathString |
	pathString := aSerializer rewritePath: aPath asString for: anObject.
	((objects includesKey: pathString) and: [(objects at: pathString) ~~ anObject])
		ifTrue: [Warning signal: 'About to overwrite another object in the store'].
	objects at: pathString put: anObject.
	(paths at: anObject ifAbsentPut: [Set new]) add: pathString.
	serializers at: pathString put: aSerializer.
	^ pathString