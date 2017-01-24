enumerating
objectReferencesDo: aBlock
	"Iterate over all references to objects in me."
	self tableOfContents keysDo: [:eachString |
		aBlock value: (SquotObjectReference delegate: (directory resolve: eachString) in: self)]