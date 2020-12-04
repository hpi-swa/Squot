accessing
at: aPackageInfo ifAbsent: aBlock
	self assert: (aPackageInfo isKindOf: PackageInfo).
	^ Extensions at: aPackageInfo ifAbsent: aBlock