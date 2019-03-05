accessing
remove: anArtifactLocator
	(locators includes: anArtifactLocator) ifFalse: [^ anArtifactLocator].
	locators := locators copyWithout: anArtifactLocator.
	^ anArtifactLocator