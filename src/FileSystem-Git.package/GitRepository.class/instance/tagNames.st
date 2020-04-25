public-accessing-objects
tagNames
	| tagNames packedRefs|
	self privateDeprecatedUseUnitOfWork.
	tagNames := OrderedCollection new.
	tagNames addAll: (self tagsDir allFiles collect: [:each | self refFromFile: each relativeTo: self tagsDir]).
	packedRefs := self packedRefs.
	((self packedRefs
		select: [:each | each name beginsWith: 'refs/tags/'])
		do: [:each | tagNames add: (each name allButFirst: 'refs/tags/' size)]).
	^ tagNames