Object
respondsTo: aSymbol
	^ (self decoratorClass canUnderstand: aSymbol)
		or: [decoratedObject respondsTo: aSymbol]