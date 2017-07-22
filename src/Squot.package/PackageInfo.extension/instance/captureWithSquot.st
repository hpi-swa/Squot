*Squot-trackable
captureWithSquot
	^ SquotPackageShadow
		forPackageNamed: self packageName
		withSnapshot: self workingCopy package snapshot squotWithSortedDefinitions