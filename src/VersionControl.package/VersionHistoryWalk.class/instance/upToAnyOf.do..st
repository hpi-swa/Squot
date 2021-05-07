accessing
upToAnyOf: subcollection do: aBlock
	"Answer all versions that are not ancestors of any of the versions in subcollection.
	The resulting list does not include the versions in subcollection either.
	Evaluate aBlock with all versions in subcollection that are reached during the walk."
	
	self excludeAncestorsOfAll: subcollection.
	^ OrderedCollection streamContents: [:versions |
		self do: [:each | versions nextPut: each].
		sinkVersions
			select: [:each | (self marked: each) isReachableFromSource]
			thenDo: aBlock]