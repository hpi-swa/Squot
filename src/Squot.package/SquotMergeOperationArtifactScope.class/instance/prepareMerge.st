as yet unclassified
prepareMerge
	^ SquotToggles useNewApi
		ifTrue:
			[(SquotProjectMergeFactory workingCopySnapshot: mergeOperation workingCopySnapshot baseSnapshot: mergeOperation baseVersion snapshot incomingSnapshot: mergeOperation mergeVersion snapshot)
				compareIncomingArtifact: artifactToMerge;
				noChangesToMetadata;
				projectMerge]
		ifFalse:
			[| base |
			base := (mergeOperation baseVersion artifactAt: artifactToMerge path
				ifPresent: [:baseArtifact | mergeOperation workingCopy newSnapshotBuilder add: baseArtifact; buildSnapshot]
				ifAbsent: [mergeOperation workingCopy lazySnapshot]).
			mergeOperation workingCopy withCurrentSnapshot: mergeOperation  workingCopySnapshot do:
				[SquotMerge
					into: mergeOperation workingCopy
					merge: (mergeOperation workingCopy newSnapshotBuilder add: artifactToMerge; buildSnapshot)
					basedOn: base]]