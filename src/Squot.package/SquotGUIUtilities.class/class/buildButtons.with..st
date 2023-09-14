toolbuilder
buildButtons: aCollection with: builder
	^ builder pluggablePanelSpec new
		layout: #horizontal;
		children: aCollection;
		minimumHeight: builder buttonRowHeight;
		verticalResizing: #rigid;
		yourself