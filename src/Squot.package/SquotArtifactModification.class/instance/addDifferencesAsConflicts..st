merging
addDifferencesAsConflicts: anArtifactMerge 
	diffContent addModificationsAsConflicts: anArtifactMerge graphMerge.
	anArtifactMerge setMetadataMerge:
		(left storeInfo squotMergeWith: right storeInfo basedOn: SquotTrackedObjectMetadata new). self flag: #encapsulation; flag: #generality.