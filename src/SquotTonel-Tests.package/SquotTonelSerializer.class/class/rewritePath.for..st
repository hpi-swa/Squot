path rewriting
rewritePath: path for: anObjectGraph
	"Append package directory if necessary."
	| elements packageName |
	elements := path squotPathSegments.
	packageName := anObjectGraph startShadow packageName.
	elements ifEmpty: [^ packageName].
	(elements last = packageName) ifTrue: [^ path].
	(elements last beginsWith: packageName)
		ifTrue: [^ elements allButLast, {packageName}
					joinSeparatedBy: SquotPath delimiter asString]
		ifFalse: [^ path, SquotPath delimiter, packageName]