as yet unclassified
writeClass: aClass at: aPath
	"collect definition and all methods (including extensions) of aClass"
	currentDirectory := snapshotBuilder at: ((aPath splitBy: '/') allButLast joinSeparatedBy: $/).
	currentDirectory ensureDirectory.
	fileTreeWriter directory: currentDirectory pathString.
	definitions addAll: aClass classDefinitions.
	aClass selectorsDo: [:each |
		definitions add: (MethodReference class: aClass selector: each) asMethodDefinition].