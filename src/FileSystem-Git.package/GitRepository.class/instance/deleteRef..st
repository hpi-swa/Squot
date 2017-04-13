public-accessing-references
deleteRef: refPath
	"Deletes the (possibly symbolic) reference denoted by refPath and its reflog."
	| refFile expandedRef |
	refFile := self baseDir resolve: (expandedRef := self expandRef: refPath).
	refFile isDirectory ifTrue: [self error: 'Incomplete reference: ', expandedRef].
	refFile ensureDeleted.
	(self reflogFileForReference: expandedRef) ensureDeleted.