toolbuilder
buildChildren: builder
	^ Array streamContents: [:stream | 
		self recursiveChildrenDo: [:each |
			stream nextPut: (each buildWith: builder)]]