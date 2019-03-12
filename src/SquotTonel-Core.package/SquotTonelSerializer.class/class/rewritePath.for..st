path rewriting
rewritePath: path for: anObjectGraph
	"Append package directory if necessary."
	| elements packageName |
	elements := path squotPathSegments.
	packageName := anObjectGraph startShadow packageName.
	(elements notEmpty and: [elements last = packageName])
		ifTrue: [^ path]
		ifFalse: [^ path
					ifEmpty: [packageName]
					ifNotEmpty: [path, SquotPath delimiter, packageName]]