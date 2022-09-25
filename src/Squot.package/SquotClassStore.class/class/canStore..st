testing
canStore: anArtifact
	| isPackage |
	isPackage := anArtifact storeInfo references anySatisfy: [:each | (each at: 'type') = 'class'].
	^ isPackage