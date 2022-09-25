private
classNameOf: anArtifact
	^ (anArtifact storeInfo references detect: [:each | (each at: 'type') = 'class']) at: 'className'