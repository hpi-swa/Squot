as yet unclassified
rewritePath: pathString ofPackage: aPackageShadow
	"Append package directory if necessary."
	| elements packageName |
	elements := pathString squotPathSegments.
	elements ifEmpty:
		[^ self addPackageDirectoryForPackage: aPackageShadow to: elements].
	packageName := aPackageShadow packageName.
	elements last = (packageName, '.package') ifTrue: [^ pathString].
	(elements last beginsWith: packageName) ifTrue:
		[^ self addPackageDirectoryForPackage: aPackageShadow
			to: elements allButLast].
	^ self addPackageDirectoryForPackage: aPackageShadow to: elements