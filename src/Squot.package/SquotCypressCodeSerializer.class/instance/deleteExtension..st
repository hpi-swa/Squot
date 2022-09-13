private
deleteExtension: classNameSymbol
	| path |
	path := classNameSymbol, '.extension'.
	(currentDirectory resolve: path) deleteAll.