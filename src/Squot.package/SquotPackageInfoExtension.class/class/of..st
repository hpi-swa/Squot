accessing
of: aPackageInfo
	^ self at: aPackageInfo ifAbsent: [Extensions at: aPackageInfo put: self new]