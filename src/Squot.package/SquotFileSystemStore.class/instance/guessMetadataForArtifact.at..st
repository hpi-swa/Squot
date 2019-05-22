guessing
guessMetadataForArtifact: anArtifact at: aFileOrDirectory
	| locators search possibleArtifacts foundMetadata |
	locators := self artifactLocators.
	search := self prepareArtifactSearchWith: locators startingAt: aFileOrDirectory.
	search searchNext.
	possibleArtifacts := search artifactsFound.
	possibleArtifacts
		ifEmpty: [SquotNoMetadataFileFound signal
					ifNotNil: [:metadata | foundMetadata := metadata]
					ifNil: [^ self error: 'No info about artifact at ', anArtifact path]]
		ifNotEmpty: [possibleArtifacts size = 1
						ifTrue: [foundMetadata := possibleArtifacts anyOne storeInfo]
						ifFalse: [foundMetadata := UIManager default	
									chooseFrom: (possibleArtifacts collect: [:each | each storeInfo serializer])
									values: (possibleArtifacts collect: #storeInfo)
									title: 'Which serializer fits best with the artifact at ', anArtifact path, '?']].
	anArtifact mergeStoreInfo: foundMetadata.