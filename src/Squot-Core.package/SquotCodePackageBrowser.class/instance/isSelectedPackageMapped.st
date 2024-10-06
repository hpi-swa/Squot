accessing
isSelectedPackageMapped
	^ self selectedPackageName notNil and: [self selectedMapper notNil]