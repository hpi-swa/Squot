choosing packages
packagesIn: aWorkingCopy
	^ OrderedCollection streamContents:
		[:packageNames |
		aWorkingCopy artifacts
			select: [:each | each storeInfo objectClassName = PackageInfo name]
			thenDo:
				[:each |
				packageNames nextPut: each packageName]]