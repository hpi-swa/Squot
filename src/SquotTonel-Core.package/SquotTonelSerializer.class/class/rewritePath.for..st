path rewriting
rewritePath: path for: aPackageShadow
	"Append package directory if necessary."
	| elements |
	elements := path squotPathSegments.
	(elements notEmpty and: [elements last = aPackageShadow packageName])
		ifTrue: [^ path]
		ifFalse: [^ path
					ifEmpty: [aPackageShadow packageName]
					ifNotEmpty: [path, SquotPath delimiter, aPackageShadow packageName]]