merging
mergeWithoutBaseWith: anArtifact
	| merge |
	merge := artifact mergeWithoutBaseWith: anArtifact.
	self applyLoadStatusTo: merge.
	^ merge