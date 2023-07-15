update migration
migrateOldArtifact: anArtifact snapshot: aSnapshot
	| artifact |
	artifact := anArtifact.
	((anArtifact storeInfo firstReferenceOfType: 'package') value includesKey: 'packageName') ifFalse:
		[| reference |
		artifact := artifact copy.
		reference := artifact storeInfo firstReferenceOfType: 'package'.
		reference key: 'package_', aSnapshot startShadow packageName.
		reference value at: 'packageName' put: aSnapshot startShadow packageName].
	^ artifact