patching
squotApplyTo: aMCSnapshot
	| patcher |
	self deprecated: 'Get resolvedPatch and apply that instead.'.
	(conflicts anySatisfy: [:each | each isResolved not]) ifTrue:
		[self error: 'Conflicts must be resolved first!'].
	patcher := MCPatcher snapshot: aMCSnapshot.
	conflicts do: [:each | each applyTo: patcher].
	operations do: [:each | each applyTo: patcher].
	^ patcher patchedSnapshot