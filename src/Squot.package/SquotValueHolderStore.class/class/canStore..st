testing
canStore: anArtifact
	^ anArtifact storeInfo references anySatisfy: [:each | (each at: 'type') = 'ValueHolder']