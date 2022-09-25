patching
applyMerge: aProjectMerge
	| project |
	aProjectMerge additions do:
		[:each | (self storeForArtifact: each object)
					putArtifact: (aProjectMerge incoming snapshotArtifact: each object)].
	aProjectMerge removals do:
		[:each | (self storeForArtifact: each object) removeArtifact: each object].
	aProjectMerge elementMerges do:
		[:each | (self storeForArtifact: each working artifact) updateArtifact: each].
	project := self readProject.
	project reorder: aProjectMerge loadOrderMerge result.
	project id isNilUUID ifTrue: [self isThisEverCalled. project id: aProjectMerge incoming id].
	project metadata: (aProjectMerge metadataMerge result as: Dictionary).
	self flag: #todo. "Ensure that the result metadata is modified according to the selections from the merge dialog."
	self writeProject: project.