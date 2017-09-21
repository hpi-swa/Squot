as yet unclassified
rewritePath: pathString ofPackage: aPackageShadow
	"Append package directory if necessary."
	| elements |
	elements := pathString squotPathSegments.
	(elements notEmpty and: [elements last endsWith: '.package'])
		ifFalse: [^ self
				addPackageDirectoryForPackage: aPackageShadow
				to: elements].
	^ pathString