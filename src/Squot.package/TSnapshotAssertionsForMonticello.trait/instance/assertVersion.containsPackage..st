utilities
assertVersion: aVersion containsPackage: packageInfo
	aVersion snapshot artifactsDo: [:each |
		((each storeInfo at: #objectClassName ifAbsent: ['']) = packageInfo class name)
			ifTrue: [^ true]].
	self fail: 'Package not found'.