loading and unloading
mergeArtifactInteractively: anArtifact from: aVersion
	"Merge a single artifact with the currently loaded one."
	| mergeBases mergeSnapshot |
	self temporarilySaveChangesDuring:
		[mergeBases := self checkMergeBasesWith: aVersion
			ifNoCommonAncestor: [^ self loadArtifactInteractively: anArtifact]
			ifAncestor: [^ self inform: 'The version already is an ancestor of the active branch tip.']
			ifDescendant: [].
		mergeSnapshot := 
			self currentSnapshot
				mergeWith: (self currentSnapshot createNewBuilder
					add: anArtifact; buildSnapshot)
				basedOn: mergeBases anyOne snapshot.
		self loadSnapshotInteractively: mergeSnapshot].