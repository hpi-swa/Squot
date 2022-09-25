copying
postCopy
	project := project copy.
	stores := stores copy.
	stores replace: [:each | each copy].
	previouslySavedArtifactSnapshots := previouslySavedArtifactSnapshots copy.
	additionalParentVersions := additionalParentVersions copy.