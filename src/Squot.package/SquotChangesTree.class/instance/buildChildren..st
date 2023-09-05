toolbuilder
buildChildren: builder
	^ Array streamContents: [:stream | | first |
		first := true.
		self recursiveChildrenDo: [:each |
			first
				ifTrue: [first := false]
				ifFalse: [stream nextPut: builder pluggableSpacerSpec new].
			stream nextPut:
				(builder pluggablePanelSpec new
					horizontalResizing: #spaceFill;
					minimumHeight: self minimumChildHeight;
					children: {each buildWith: builder};
					yourself)]]