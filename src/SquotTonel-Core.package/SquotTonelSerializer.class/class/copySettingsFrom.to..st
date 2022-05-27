as yet unclassified
copySettingsFrom: anArtifact to: newTrackedObjectMetadata
	"Use same setting for Squeak changestamps."
	| existingProperties package newExtension |
	existingProperties := (SquotPackageInfoExtension of: (PackageInfo named: anArtifact packageName)) tonelProperties.
	package := PackageInfo named: (newTrackedObjectMetadata at: #packageName).
	(existingProperties at: TonelWriter squeakChangestamp ifAbsent: [false]) ifTrue:
		[newExtension := SquotPackageInfoExtension of: package.
		newExtension tonelProperties:
			(newExtension tonelProperties
				at: TonelWriter squeakChangestamp put: true;
				yourself)].