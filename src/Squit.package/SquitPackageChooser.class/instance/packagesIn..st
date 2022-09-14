choosing packages
packagesIn: aWorkingCopy
	^ aWorkingCopy artifacts
		select: [:each | each storeInfo objectClassName = PackageInfo name]
		thenCollect: [:each | each packageName]