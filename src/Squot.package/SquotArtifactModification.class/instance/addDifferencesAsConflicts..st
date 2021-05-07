merging
addDifferencesAsConflicts: anArtifactMerge
	self deprecated: 'Effect a merge with an empty artifact as base instead'.
	diffContent addModificationsAsConflicts: anArtifactMerge graphMerge.
	anArtifactMerge setMetadataMerge:
		(left storeInfo squotMergeWith: right storeInfo basedOn: SquotTrackedObjectMetadata new).