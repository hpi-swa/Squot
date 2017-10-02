adding and removing
add: anArtifact
	anArtifact wantsToBeInTableOfContents ifFalse: [^ self].
	self dictionary at: anArtifact path put: anArtifact storeInfo serializer.