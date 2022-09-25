testing
canStore: anArtifact
	^ anArtifact storeInfo references anySatisfy: [:each | (each at: 'content-type') = 'application/octet-stream' and: [(each at: 'codec-class') = 'SmartRefStream']]