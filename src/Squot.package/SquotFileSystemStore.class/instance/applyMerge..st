patching
applyMerge: aProjectMerge
	self flag: #todo. "progress display"
	self assert: aProjectMerge hasConflicts not description: 'Unresolved conflicts'.
	aProjectMerge additions do:
		[:each | (self storeForArtifact: each object) putArtifact: (aProjectMerge result snapshotArtifact: each object)].
	aProjectMerge removals do:
		[:each | (self storeForArtifact: each object) removeArtifact: each object].
	aProjectMerge elementMerges do:
		[:each | (self storeForArtifact: each result artifact) updateArtifact: each].
	self writeProject: aProjectMerge result project.
	self flag: #todo. "Ensure that the result project is modified according to the selections from the merge dialog."
	^ self snapshot