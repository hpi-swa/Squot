private
updateMetadataAfterSaving
	"Some repositories cause additional metadata to be added when saving an artifact for the first time. Bring this into the working copy. The patch was used to create newVersion which may have a slightly different snapshot (e. g. because the repository added something or put additional metadata for the serialization)."
	| paths savedPaths newlyAddedArtifacts |
	paths := workingCopy artifacts collect: [:each | each path].
	savedPaths := patch patched artifacts collect: [:each | each path].
	newlyAddedArtifacts := newVersion artifacts select: [:each | (paths includes: each path) not and: [(savedPaths includes: each path) not]].
	newlyAddedArtifacts do: [:each | workingCopy addUnloaded: each].
	paths do:
		[:eachPath | | workingArtifact savedArtifact versionArtifact metadataMerge metadataDiff |
		workingArtifact := workingCopy artifactAt: eachPath ifAbsent: [].
		savedArtifact := patch patched artifactAt: eachPath ifAbsent: [].
		versionArtifact := newVersion artifactAt: eachPath ifAbsent: [].
		"Artifacts may have been removed from the working copy without saving this.
		Artifacts may have been added to the working copy without saving them."
		versionArtifact notNil & savedArtifact notNil & workingArtifact notNil
			ifTrue:
				[workingArtifact isLoaded
					ifTrue: "Cherry-pick any changes back to the working copy if they do not conflict."
						[metadataMerge := workingArtifact storeInfo squotMergeWith: versionArtifact storeInfo basedOn: savedArtifact storeInfo.
						metadataMerge conflicts do: [:each | each chooseWorking].
						metadataMerge hasChanges ifTrue:
							[metadataDiff := metadataMerge resolvedPatch.
							workingCopy
								applyDiff:
									(SquotArtifactModification
										left: workingArtifact
										right: (savedArtifact copy storeInfo: metadataDiff right; yourself)
										isLoadedInWorkingCopy: true
										contentDiff: SquotObjectGraphDiff new
										metadataDiff: metadataDiff)
								toObjectAt: eachPath].
						(versionArtifact id notNil and: [workingArtifact id ~= versionArtifact id]) 
							ifTrue: [workingArtifact id: versionArtifact id]. "Take id from version. Ids are ignored during merges and comparisons above."]
					ifFalse: "Just overwrite unloaded artifact's metadata"
						[workingArtifact storeInfo: versionArtifact storeInfo]]].