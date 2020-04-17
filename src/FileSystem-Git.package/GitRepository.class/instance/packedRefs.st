accessing-references
packedRefs
	| packedRefsFile |
	self privateDeprecatedUseUnitOfWork.
	packedRefsFile := self baseDir resolve: 'packed-refs'.
	^ GitPackedRefs on: packedRefsFile