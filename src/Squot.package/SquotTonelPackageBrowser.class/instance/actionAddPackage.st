actions
actionAddPackage
	self workingCopy addMapper:
		(SquotTonelMapper
			package: (MCPackage named: self selectedPackageName)
			path: self commonPackagePathPrefix).