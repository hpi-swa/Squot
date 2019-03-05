accessing
add: anArtifactLocator
	(locators includes: anArtifactLocator) ifTrue: [^ anArtifactLocator].
	locators := locators copyWith: anArtifactLocator.
	^ anArtifactLocator