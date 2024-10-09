actions
actionAddPackage
	| packageInfo conflictingPackages |
	packageInfo := PackageInfo new packageName: self selectedPackageName; yourself.
	conflictingPackages := self mappedPackageList select: [:each |
								packageInfo includesSystemCategory: each].

	conflictingPackages ifNotEmpty: [
		(self confirm: ('To add  package ''{1}'', we will first remove {2}, ',
			'because the new package is a prefix/super package for these.', String cr,
			'(Otherwise the package contents will be duplicated)' format: {
				self selectedPackageName.
				conflictingPackages joinSeparatedBy: ', '.
			})) ifFalse: [^ self]].

	conflictingPackages do: [:each | self removePackage: each].
	self workingCopy addMapper:
		(GSTonelMapper
			package: (MCPackage named: self selectedPackageName)
			path: self commonPackagePathPrefix).