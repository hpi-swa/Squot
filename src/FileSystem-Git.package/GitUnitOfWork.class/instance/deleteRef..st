accessing
deleteRef: refPath
	"Deletes the (possibly symbolic) reference denoted by refPath and its reflog."
	| expandedRef |
	expandedRef := self expandRef: refPath.
	expandedRef ifNil: ["does not exist" ^ self].
	refStores do: [:each | each delete: expandedRef].
	(repository reflogFileForReference: expandedRef) ensureDeleted.
	refLogs removeKey: refPath ifAbsent: [].
	{refs. resolvedRefs} do: [:each | each at: expandedRef put: nil].
	symbolicRefs removeKey: expandedRef ifAbsent: [].