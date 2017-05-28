as yet unclassified
rewritePath: pathString ofPackage: aPackageInfo
	"Append package directory if necessary."
	| elements |
	elements := pathString squotPathSegments.
	(elements notEmpty and: [elements last endsWith: '.package'])
		ifFalse: [^ self
				addPackageDirectoryForPackage: aPackageInfo
				to: elements].
	^ pathString