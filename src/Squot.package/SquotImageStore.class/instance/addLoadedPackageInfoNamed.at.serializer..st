adding and removing
addLoadedPackageInfoNamed: packageName at: path serializer: aSerializerClass
	"Add PackageInfo artifact and get the environment from the working copy, if it exists."
	| package |
	Environment current packageOrganizer packageNamed: packageName ifAbsent: [^ self].
	self add: (PackageInfo named: packageName) at: path serializer: aSerializerClass.
	(package := MCPackage named: packageName) hasWorkingCopy
		ifTrue: [(additionalInfo at: path) at: #environment put: package workingCopy environment].