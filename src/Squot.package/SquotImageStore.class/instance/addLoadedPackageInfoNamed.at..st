adding and removing
addLoadedPackageInfoNamed: packageName at: path
	"Add PackageInfo artifact and get the environment from the working copy, if it exists."
	self add: (PackageInfo named: packageName) at: path.