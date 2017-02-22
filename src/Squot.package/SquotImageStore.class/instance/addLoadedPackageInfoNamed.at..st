adding and removing
addLoadedPackageInfoNamed: packageName at: path
	"Add PackageInfo artifact and get the environment from the working copy, if it exists."
	| package |
	self add: (PackageInfo named: packageName) at: path.
	(package := MCPackage named: packageName) hasWorkingCopy
		ifTrue: [(additionalInfo at: path) at: #environment put: package workingCopy environment].