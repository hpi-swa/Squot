*Squot-Packages
addPackageNamed: packageName at: path
	| newArtifact serializer |
	"Use same format as existing package(s)."
	serializer := self packageSerializer ifNil: [SquotPackageShadow squotPreferredSerializer name].
	newArtifact := self add: (PackageInfo named: packageName) at: path.
	newArtifact serializer: (self environment valueOf: serializer).
	^ newArtifact