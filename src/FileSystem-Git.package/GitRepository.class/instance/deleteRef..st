public-accessing-references
deleteRef: refPath
	"Deletes the (possibly symbolic) reference denoted by refPath and its reflog."
	| refFile expandedRef |
	expandedRef := self expandRef: refPath.
	expandedRef ifNil: ["does not exist" ^ self].
	refFile := self baseDir resolve: expandedRef.
	refFile isDirectory ifTrue: [self error: 'Incomplete reference: ', expandedRef].
	refFile ensureDeleted.
	self packedRefs delete: refPath.
	(self reflogFileForReference: expandedRef) ensureDeleted.