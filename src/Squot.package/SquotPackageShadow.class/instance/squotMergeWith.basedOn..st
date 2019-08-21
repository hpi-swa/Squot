merging
squotMergeWith: incomingPackageShadow basedOn: basePackageShadow
	^ (basePackageShadow
		asBaseDiffLeft: snapshot
		withRight: incomingPackageShadow
		with: nil "diff builder, unused")
		working: self;
		yourself