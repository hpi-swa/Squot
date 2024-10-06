toolbuilder
buildLayout: frameToChildCollection with: builder
	^ builder pluggablePanelSpec new
		children: ((self children: frameToChildCollection) collect: [:each |
			each value
				frame: each key;
				yourself]);
		wantsResizeHandles: true;
		yourself