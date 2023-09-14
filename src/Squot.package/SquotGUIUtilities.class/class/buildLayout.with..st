toolbuilder
buildLayout: frameToChildCollection with: builder
	^ builder pluggablePanelSpec new
		children: ((self children: frameToChildCollection) collect: [:each |
			builder pluggablePanelSpec new
				children: {each value};
				frame: each key;
				yourself]);
		wantsResizeHandles: true;
		frame: LayoutFrame fullFrame;
		yourself