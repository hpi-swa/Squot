toolbuilder
buildChildren: builder
	^ Array streamContents: [:stream | 
		self recursiveChildrenDo: [:each |
			stream nextPut: (self buildChild: each with: builder)]]