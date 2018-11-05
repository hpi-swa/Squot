*Squot-diff-manipulation
squotAdjustToResemble: aSquotDiffNode
	"Answer a patch with the active operations from aSquotDiffNode."
	| selectedOperations |
	selectedOperations := (((aSquotDiffNode withAllChildren
		select: [:each | each isActive])
		reject: [:each | each == aSquotDiffNode])
		collect: [:each | each content])
		reject: [:each | each isNil].
	^ MCPatch operations: selectedOperations