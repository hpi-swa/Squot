*Squot-Packages
addPackageNamed: packageName at: path
	| serializer |
	"Use same format as existing package(s)."
	serializer := self packageSerializer ifNil: [SquotPackageShadow squotPreferredSerializer name].
	^ self addPackageNamed: packageName at: path serializer: (self environment valueOf: serializer)