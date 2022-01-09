*Squot-Packages
addLoadedPackageInfoNamed: packageName at: path serializer: aSerializerClass
	"Add PackageInfo artifact and get the environment from the working copy, if it exists."
	| packageInfo |
	packageInfo := Environment current packageOrganizer packageNamed: packageName ifAbsent: [^ self].
	(packageInfo classes isEmpty and: [packageInfo methods isEmpty]) ifTrue: [^ self].
	^ self addPackageNamed: packageName at: path serializer: aSerializerClass