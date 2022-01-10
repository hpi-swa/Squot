initialization
createTextPaneFor: aSymbol 

	| textPane |
	textPane := PluggableTextMorph
				on: self
				text: aSymbol
				accept: (aSymbol, #:) asSymbol
				"readSelection: #selectionInterval
				menu: #codePaneMenu:shifted:".
	textPane 
		showScrollBarsOnlyWhenNeeded;
		wantsFrameAdornments: false;
		hasUnacceptedEdits: true;
		askBeforeDiscardingEdits: false;
		setProperty: #alwaysAccept toValue: true;
		acceptOnCR: true;
		setNameTo: aSymbol asString;
		layoutFrame: (LayoutFrame fractions: (0@0 corner: 1@1));
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		minimumExtent: 0@2;
		updateMinimumExtent;
		scrollToTop.
	^ textPane