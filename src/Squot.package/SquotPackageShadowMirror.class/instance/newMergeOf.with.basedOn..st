comparing
newMergeOf: workingPackageShadow with: incomingPackageShadow basedOn: basePackageShadow
	^ workingPackageShadow squotMergeWith: incomingPackageShadow basedOn: (basePackageShadow ifNil: [workingPackageShadow copyWithSnapshot: MCSnapshot empty])