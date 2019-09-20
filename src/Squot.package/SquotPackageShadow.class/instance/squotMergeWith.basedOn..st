merging
squotMergeWith: incomingPackageShadow basedOn: basePackageShadow
	self flag: #todo. "clean up methods to remove unused diff builder reference"
	^ (basePackageShadow
		asBaseDiffLeft: snapshot
		withRight: incomingPackageShadow
		with: nil "diff builder, unused")
		working: self;
		yourself