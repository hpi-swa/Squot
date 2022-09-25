merging
applyMerge: aProjectMerge
	aProjectMerge additions do:
		[:each | self putArtifact: each object.
		(self storeForArtifact: each object) putArtifact: (aProjectMerge incoming snapshotArtifact: each object)].
	aProjectMerge removals do:
		[:each | self project removeArtifactAt: each object id.
		(self storeForArtifact: each object) removeArtifact: each object].
	aProjectMerge elementMerges do:
		[:each |
		(each result artifact storeInfo includesKey: 'load')
			ifTrue:
				[| storeImpl | storeImpl := each result artifact storeInfo removeKey: 'load'.
				(self storesOnlySnapshotOf: each working artifact)
					ifTrue:
						[(self storeForArtifact: each working artifact) removeArtifact: each working artifact].
						self useStoreImplementation: storeImpl forArtifact: each result artifact.
						(self storeForArtifact: each result artifact) putArtifact: each result]
			ifFalse:
				[(self storeForArtifact: each result artifact) updateArtifact: each].
		self flag: #todo. "Ensure that the #result artifact is modified according to the selections from the merge dialog."
		self putArtifact: each result artifact].
	self project reorder: aProjectMerge loadOrderMerge result.
	self project id isNilUUID ifTrue: [self isThisEverCalled. self project id: aProjectMerge incoming id].
	self project metadata: (aProjectMerge metadataMerge result as: Dictionary).
	self flag: #todo. "Ensure that the result metadata is modified according to the selections from the merge dialog."