as yet unclassified
rewritePath: pathString ofClass: aClassShadow
	"Append package and class directory if necessary."
	| elements |
	elements := pathString squotPathSegments.
	elements size < 2
		ifTrue: [^ self addPackageAndClassDirectoryForClass: aClassShadow to: elements].
	((elements at: elements size - 1) endsWith: '.package')
		ifFalse: [^ self addPackageAndClassDirectoryForClass: aClassShadow to: elements].
	(elements last = (aClassShadow className, '.class'))
		ifFalse: [^ self addPackageAndClassDirectoryForClass: aClassShadow to: elements].
	^ pathString