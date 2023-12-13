refs
deleteRef: refPath
	"Deletes the (possibly symbolic) reference denoted by refPath and its reflog."
	| expandedRef |
	expandedRef := self expandRef: refPath.
	expandedRef ifNil: ["does not exist" ^ self].
	refStores do: [:each | each delete: expandedRef].
	(repository reflogFileForReference: expandedRef) ensureDeleted.
	refLogs removeKey: refPath ifAbsent: [].
	refCache deleteRef: expandedRef.
	self unsetUpstreamOfBranchNamed: refPath.
	self refChanged: (GitReference zeroRefWithName: expandedRef).