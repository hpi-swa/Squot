*Squot-comparing
squotAdjustToResemble: aSquotDiffNode
	"Answer a patch with the active operations from aSquotDiffNode."
	| selectedOperations |
	selectedOperations := ((aSquotDiffNode withAllChildren
		select: [:each | each isActive])
		collect: [:each | each content])
		reject: [:each | each isNil].
	^ MCPatch operations: selectedOperations