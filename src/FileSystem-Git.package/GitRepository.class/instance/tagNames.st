public-accessing-objects
tagNames
	| tagRefs tagNames packedRefs|
	tagNames := OrderedCollection new.
	tagRefs := self tagsDir children.
	tagRefs do: [:ref | tagNames add: ref basename].
	packedRefs := self packedRefs.
	((self packedRefs
		select: [:each | each name beginsWith: 'refs/tags/'])
		do: [:each | tagNames add: (each name allButFirst: 'refs/tags/' size)]).
	^ tagNames