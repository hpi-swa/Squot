*Squot-trackable
captureWithSquot
	^ self squotShadowFactory
		forPackageNamed: self packageName
		withSnapshot: self workingCopy package snapshot squotWithSortedDefinitions