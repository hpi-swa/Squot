*Squot
squotApplyDiffNode: aSquotDiffNode
	"Answer a snapshot that is me patched by the operations in the given hierarchical diff"
	| patch |
	patch := MCPatch new squotAdjustToResemble: aSquotDiffNode.
	^ MCPatcher apply: patch to: self