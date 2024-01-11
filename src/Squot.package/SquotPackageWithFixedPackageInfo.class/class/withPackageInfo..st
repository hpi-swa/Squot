as yet unclassified
withPackageInfo: aPackageInfo
	^ (self named: aPackageInfo name)
		packageInfo: aPackageInfo;
		yourself