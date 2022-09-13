tests
testChangestampsEnabledInAddedPackageToo
	"Tonel does not store change stamps by default. But when #'squeak_changestamp' is enabled in the package properties, they will be written as a custom property on methods for Squeak to use. When a new package is tracked in the working copy and changestamps are already enabled in other packages, also enable them in the added package by default."
	| packageExtension originalProperties |
	"Given"
	workingCopy addLoadedPackageInfoNamed: self class category at: 'src/', self class category serializer: SquotTonelSerializer.
	packageExtension := SquotPackageInfoExtension of: (PackageInfo named: self class category).
	originalProperties := packageExtension tonelProperties.
	[packageExtension tonelProperties: (packageExtension tonelProperties copy at: TonelWriter squeakChangestamp put: true; yourself).
	"When"
	workingCopy addPackageNamed: 'SquotTonel-TestXyz' at: 'src/SquotTonel-TestXyz'.
	"Then"
	packageExtension := SquotPackageInfoExtension of: (PackageInfo named: 'SquotTonel-TestXyz').
	self assert: true equals: (packageExtension tonelProperties at: TonelWriter squeakChangestamp ifAbsent: [false])]
		ensure: [(SquotPackageInfoExtension of: (PackageInfo named: self class category)) tonelProperties: originalProperties].