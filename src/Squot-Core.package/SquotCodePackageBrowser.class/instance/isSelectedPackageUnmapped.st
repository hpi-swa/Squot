accessing
isSelectedPackageUnmapped
	^ self selectedPackageName notNil and: [self selectedMapper isNil]