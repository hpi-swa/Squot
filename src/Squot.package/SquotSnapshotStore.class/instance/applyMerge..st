patching
applyMerge: aProjectMerge
	aProjectMerge additions do:
		[:each |
		project putArtifact: each object copy.
		artifactSnapshots at: each object id put: (aProjectMerge incoming snapshotArtifact: each object)].
	aProjectMerge removals do:
		[:each |
		project removeArtifactAt: each object id.
		artifactSnapshots removeKey: each object id ifAbsent: []].
	aProjectMerge elementMerges do:
		[:each |
		project putArtifact: each result artifact copy.
		artifactSnapshots at: each working artifact id put: each result.
		self flag: #todo. "Ensure that the #result snapshot is modified according to the selections from the merge dialog."].
	project reorder: aProjectMerge loadOrderMerge result.
	project id isNilUUID ifTrue: [project id: aProjectMerge incoming id].
	project metadata: (aProjectMerge metadataMerge result as: Dictionary).
	self flag: #todo. "Ensure that the result metadata is modified according to the selections from the merge dialog."