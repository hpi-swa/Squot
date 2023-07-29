private
updateMetadataAfterSaving
	"Some repositories cause additional metadata to be added when saving an artifact for the first time. Bring this into the working copy. The patch was used to create newVersion which may have a slightly different snapshot (e. g. because the repository added something or put additional metadata for the serialization)."
	| paths savedPaths newlyAddedArtifacts |
	SquotToggles useNewApi ifTrue:
		[| storedSnapshot |
		"Add unloaded"
		storedSnapshot := newVersion snapshot.
		newlyAddedArtifacts := storedSnapshot artifacts select: [:each | (workingCopy project includesArtifactWithId: each id) not and: [(patch result artifacts includesKey: each id) not]].
		newlyAddedArtifacts do:
			[:each | | copy | copy := each copy.
			workingCopy putArtifact: copy.
			workingCopy useStoreImplementation: SquotSnapshotStore forArtifact: copy.
			(workingCopy storeForArtifact: copy) putArtifact: (SquotArtifactSnapshot artifact: copy objectSnapshot: (storedSnapshot snapshotArtifact: each) objectSnapshot)].
		"Update metadata"
		workingCopy project artifacts do:
			[:workingArtifact | | savedArtifact versionArtifact metadataMerge metadataDiff |
			savedArtifact := [patch incoming reflect: workingArtifact asObjectReference of: patch incoming] on: NotFound do: [:e | e return: nil].
			versionArtifact := [storedSnapshot reflect: workingArtifact asObjectReference of: storedSnapshot] on: NotFound do: [:e | e return: nil].
			"Artifacts may have been removed from the working copy without saving this.
			Artifacts may have been added to the working copy without saving them."
			versionArtifact notNil & savedArtifact notNil & workingArtifact notNil
				ifTrue: "Cherry-pick any changes back to the working copy if they do not conflict."
					[metadataMerge := workingArtifact storeInfo squotMergeWith: versionArtifact storeInfo basedOn: savedArtifact storeInfo.
					metadataMerge conflicts do: [:each | each chooseWorking].
					metadataMerge hasChanges ifTrue:
						[metadataDiff := metadataMerge resolvedPatch.
						workingArtifact storeInfo: metadataMerge resolvedPatch right].
					(versionArtifact id notNil and: [workingArtifact id ~= versionArtifact id]) 
						ifTrue: "Take id from version. Ids are ignored during merges and comparisons above."
							[workingCopy updateArtifactIdFrom: workingArtifact id to: versionArtifact id]]].
		^ self].
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