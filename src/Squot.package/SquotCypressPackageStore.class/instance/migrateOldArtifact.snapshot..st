update migration
migrateOldArtifact: anArtifact snapshot: aSnapshot
	| artifact |
	artifact := anArtifact.
	((anArtifact storeInfo references detect: [:each | (each at: 'type') = 'package']) includesKey: 'packageName') ifFalse:
		[| reference |
		artifact := artifact copy.
		reference := (artifact storeInfo at: 'references') detect: [:each | (each value at: 'type') = 'package'].
		reference key: 'package_', aSnapshot startShadow packageName.
		reference value at: 'packageName' put: aSnapshot startShadow packageName].
	^ artifact