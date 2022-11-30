private storing
validatePathOf: anArtifact
	"Check that the path of the artifact is valid according to its serializer."
	| storeInfo |
	storeInfo := anArtifact storeInfo copy
		at: #path put: anArtifact path;
		yourself.
	self initializeStoreInfo: storeInfo forObject: anArtifact content.
	(storeInfo at: #path) ~= anArtifact path ifTrue:
		[self error: 'Invalid path to store ', anArtifact printString].
	^ storeInfo at: #path