syncing
syncMethods: selectorCollection withFiles: aDirectory 
	|selectors methodFiles|
	aDirectory exists
		ifFalse: [ ^ self ].
	selectors := selectorCollection asSet.
	methodFiles := aDirectory glob: [:path| path basename endsWith: '.st'].
	methodFiles do: [ :path|
		(selectors includes: (path basename copyUpToLast: $.) asSymbol)
			ifFalse: [ path reference delete ]].