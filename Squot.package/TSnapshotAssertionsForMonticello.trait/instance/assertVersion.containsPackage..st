utilities
assertVersion: aVersion containsPackage: packageInfo
	aVersion snapshot artifactsDo: [:each |
		((each path endsWith: packageInfo packageName, '.package')
			and: [(each storeInfo at: #objectClassName) = packageInfo class name])
			ifTrue: [^ true]].
	self fail: 'Package not found'.