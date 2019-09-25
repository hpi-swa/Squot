merging
mergeSnapshot: incomingPackageShadow basedOn: basePackageShadow
	^ incomingPackageShadow mergeSnapshotInto: snapshot basedOn: basePackageShadow