merging
squotMergeWith: incomingPackageShadow basedOn: basePackageShadow
	^ SquotPackageMerge
		into: self
		merge: incomingPackageShadow
		basedOn: basePackageShadow