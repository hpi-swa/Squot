sar
addAssetLoaderClassToSar: aSarBuilder
	| package packageInfo packageName |
	packageName := self class package name.
	packageInfo := SquotLimitedPackageInfo new
						packageName: packageName;
						classes: GitStandaloneAssetLoader classDependencies;
						yourself.
	package := SquotPackageWithFixedPackageInfo withPackageInfo: packageInfo.
	aSarBuilder addPackage: package at: packageName.