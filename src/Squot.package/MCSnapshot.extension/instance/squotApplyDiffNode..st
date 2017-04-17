*Squot
squotApplyDiffNode: aSquotDiffNode
	"Answer a snapshot that is me patched by the operations in the given hierarchical diff"
	| operations patch |
	operations := ((aSquotDiffNode withAllChildren
		select: [:each | each isActive])
		collect: [:each | each content])
		reject: [:each | each isNil].
	patch := MCPatch operations: operations.
	^ MCPatcher apply: patch to: self