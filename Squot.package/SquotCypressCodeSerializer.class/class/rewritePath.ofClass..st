as yet unclassified
rewritePath: pathString ofClass: aClass
	"Append package and class directory if necessary."
	| elements |
	elements := pathString splitBy: '/'.
	elements size < 2
		ifTrue: [^ self addPackageAndClassDirectoryForClass: aClass to: elements].
	((elements at: elements size - 1) endsWith: '.package')
		ifFalse: [^ self addPackageAndClassDirectoryForClass: aClass to: elements].
	(elements last = (aClass name, '.class'))
		ifFalse: [^ self addPackageAndClassDirectoryForClass: aClass to: elements].
	^ pathString