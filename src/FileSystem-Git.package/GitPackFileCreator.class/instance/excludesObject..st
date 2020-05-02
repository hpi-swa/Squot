accessing
excludesObject: aGitObject
	"Answer whether this object was excluded from being put into the pack."
	^ self excludedHashes includes: aGitObject hash