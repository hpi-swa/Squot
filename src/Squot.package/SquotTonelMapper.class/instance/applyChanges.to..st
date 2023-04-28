changes-operations
applyChanges: aCollection to: aSnapshot
	| patcher |
	patcher := MCPatcher snapshot: aSnapshot.
	aCollection do: [:each | each applyTo: patcher].
	^ patcher patchedSnapshot