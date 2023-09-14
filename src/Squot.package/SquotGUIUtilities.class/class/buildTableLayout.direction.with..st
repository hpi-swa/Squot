toolbuilder
buildTableLayout: aCollection direction: aSymbol with: builder
	^ builder pluggablePanelSpec new
		layout: aSymbol;
		children: ((self children: aCollection)
					do: [:each | each frame: nil];
					yourself);
		frame: LayoutFrame fullFrame;
		yourself