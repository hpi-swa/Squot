private storing
add: anArtifact toTableOfContents: aDictionary
	aDictionary at: anArtifact path put: (anArtifact storeInfo at: #serializer).