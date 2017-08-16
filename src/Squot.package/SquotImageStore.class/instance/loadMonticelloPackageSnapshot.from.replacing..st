private materializing
loadMonticelloPackageSnapshot: anMCSnapshot from: anArtifact replacing: aPackageInfo
	| packageDirectory packageName pathElements mcPackage packageSnapshot patch loader |
	self isThisEverCalled.
	self assert: ((aPackageInfo isKindOf: PackageInfo) or: [aPackageInfo isNil]).
	packageDirectory := (pathElements := anArtifact path squotPathSegments) last.
	packageName := packageDirectory allButLast: '.package' size.
	mcPackage := MCPackage named: packageName.
	"partially borrowed from MCPackageLoader>>#updatePackage:withSnapshot:"
	packageSnapshot := mcPackage snapshot.
	patch := anMCSnapshot patchRelativeToBase: packageSnapshot.
	patch isEmpty ifFalse:
		[loader := MCPackageLoader new.
		patch applyTo: loader.
		packageSnapshot definitions do: [:each | loader provisions addAll: each provisions].
		"end of borrowed code"
		loader loadWithNameLike: packageName].
	^ PackageInfo named: packageName