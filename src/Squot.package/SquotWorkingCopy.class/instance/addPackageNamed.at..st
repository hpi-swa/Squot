adding and removing
addPackageNamed: packageName at: path
	| actualPath serializer |
	"Use same format as existing package(s)."
	serializer := self packageSerializer ifNil: [SquotPackageShadow squotPreferredSerializer name].
	actualPath := self add: (PackageInfo named: packageName) at: path.
	(self artifactAt: actualPath) serializer: (self environment valueOf: serializer).
	^ actualPath