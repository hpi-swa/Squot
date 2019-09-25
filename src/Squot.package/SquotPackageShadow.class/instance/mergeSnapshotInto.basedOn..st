merging
mergeSnapshotInto: workingMCSnapshot basedOn: basePackageShadow
	^ basePackageShadow mergeSnapshot: snapshot into: workingMCSnapshot