accessing-references
packedRefs
	| packedRefsFile |
	packedRefsFile := self baseDir resolve: 'packed-refs'.
	^ GitPackedRefs on: packedRefsFile