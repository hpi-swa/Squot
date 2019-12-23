adding and removing
addLoadedPackageInfoNamed: packageName at: path serializer: aSerializerClass
	"Add PackageInfo artifact and get the environment from the working copy, if it exists."
	Environment current packageOrganizer packageNamed: packageName ifAbsent: [^ self].
	self add: (PackageInfo named: packageName) at: path serializer: aSerializerClass.