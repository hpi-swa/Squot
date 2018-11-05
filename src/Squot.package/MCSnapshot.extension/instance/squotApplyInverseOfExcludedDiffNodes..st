*Squot-shadow-diffing
squotApplyInverseOfExcludedDiffNodes: aSquotDiffNode
	"Answer a snapshot that is me subtracted by the excluded operations in the given hierarchical diff"
	| operations subtractingPatch |
	operations := ((((aSquotDiffNode withAllChildren
		select: [:diffNode | diffNode isActive not])
		reject: [:diffNode | diffNode == aSquotDiffNode])
		collect: [:diffNode | diffNode content])
		reject: [:operation | operation isNil])
		collect: [:operation | operation inverse].
	subtractingPatch := MCPatch operations: operations.
	^ MCPatcher apply: subtractingPatch to: self