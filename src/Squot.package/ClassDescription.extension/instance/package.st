*Squot-package
package
	"Answer my package according to my environment's PackageOrganizer."
	^ self environment info packages packageOfClass: self
		ifNone: [self environment info packages packageOfSystemCategory: self category
			ifNone: [PackageInfo named: self category]]