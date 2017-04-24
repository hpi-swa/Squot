merging
mergeWith: otherArtifact basedOn: baseArtifact
	^ self copyWithDifferentContent:
		(otherArtifact dispatchMergeContentWith: content basedOn: baseArtifact)