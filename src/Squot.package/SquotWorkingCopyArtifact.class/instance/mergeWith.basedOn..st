merging
mergeWith: incomingArtifact basedOn: baseArtifact
	| merge |
	merge := artifact mergeWith: incomingArtifact basedOn: baseArtifact.
	merge working: self.
	^ merge