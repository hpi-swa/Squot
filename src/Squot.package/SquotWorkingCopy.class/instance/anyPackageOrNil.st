*Squot-Packages
anyPackageOrNil
	^ self artifacts
		detect: [:each | (each storeInfo at: #objectClassName ifAbsent: []) = #PackageInfo]
		ifNone: []