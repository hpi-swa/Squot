private
symbolInChangeSet: aSymbol
	"Class traits come in with ' classSide' at the end, but need to be stored with ' classTrait'"
	^ (aSymbol endsWith: ' classSide')
		ifTrue: [aSymbol asString copyReplaceFrom: aSymbol size - 'Side' size + 1 to: aSymbol size with: 'Trait']
		ifFalse: [aSymbol]