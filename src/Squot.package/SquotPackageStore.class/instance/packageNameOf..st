private
packageNameOf: anArtifact
	| packageName |
	packageName := (anArtifact storeInfo references detect: [:each | (each at: 'type') = 'package']) at: 'packageName'.
	^ packageName