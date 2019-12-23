Squot-diff-patching
squotApplyToLoaded: aPackageInfo
	(PackageInfo squotEnvironmentInMetadata: SquotCurrentMetadata value)
	beCurrentDuring:
		[^ patch squotApplyToLoaded: aPackageInfo]