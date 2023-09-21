toolbuilder
buildLayout: builder
	^ {(self buildInputsPanel: builder)
			frame: LayoutFrame fullFrame;
			yourself}