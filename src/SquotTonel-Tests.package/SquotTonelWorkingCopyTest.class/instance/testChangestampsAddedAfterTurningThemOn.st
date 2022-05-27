tests
testChangestampsAddedAfterTurningThemOn
	"Tonel does not store change stamps by default. But when #'squeak_changestamp' is enabled in the package properties, they will be written as a custom property on methods for Squeak to use. When the image has stamps for the methods, which were not stored before, and then the squeak_changestamp is enabled, all stamps are added in the Tonel files."
	| packageExtension loadedTimestamp savedTimestamp |
	"Given"
	workingCopy addLoadedPackageInfoNamed: self class category at: 'src/', self class category serializer: SquotTonelSerializer.
	workingCopy saveVersionWithMessage: 'Add package without stamps'.
	"When"
	packageExtension := SquotPackageInfoExtension of: (PackageInfo named: self class category).
	packageExtension tonelProperties: (packageExtension tonelProperties copy at: TonelWriter squeakChangestamp put: true; yourself).
	workingCopy saveVersionWithMessage: 'Add stamps'.
	"Then"
	savedTimestamp := ((workingCopy baseVersion snapshot artifactAt: 'src/', self class category) content startShadow asMCSnapshot definitions detect: [:each | each isMethodDefinition and: [each selector = self selector]]) timeStamp.
	loadedTimestamp := (self class >> self selector) timeStamp.
	self assert: loadedTimestamp equals: savedTimestamp.