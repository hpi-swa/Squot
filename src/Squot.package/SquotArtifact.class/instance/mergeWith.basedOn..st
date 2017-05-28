merging
mergeWith: otherArtifact basedOn: baseArtifact
	^ self copyWithDifferentContent:
		(otherArtifact dispatchMergeContentWith: self content basedOn: baseArtifact)