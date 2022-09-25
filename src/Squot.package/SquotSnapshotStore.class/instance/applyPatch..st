patching
applyPatch: aProjectMerge
	self assert: aProjectMerge hasConflicts not description: 'Unresolved conflicts'.
	^ self applyMerge: aProjectMerge