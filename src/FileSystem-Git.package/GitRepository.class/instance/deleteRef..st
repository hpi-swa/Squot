public-accessing-references
deleteRef: refPath
	"Deletes the (possibly symbolic) reference denoted by refPath and its reflog."
	| refFile |
	refFile := self baseDir resolve: refPath.
	refFile isDirectory ifTrue: [self error: 'Incomplete reference: ', refPath].
	refFile ensureDeleted.
	(self reflogFileForReference: refPath) ensureDeleted.