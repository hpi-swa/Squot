toolbuilder
buildChildren: builder
	^ Array streamContents: [:stream | 
		self recursiveChildrenDo: [:each |
			stream nextPut:
				(builder pluggablePanelSpec new
					horizontalResizing: #spaceFill;
					minimumHeight: (self minimumChildHeight: builder);
					children: {each buildWith: builder};
					yourself)]]