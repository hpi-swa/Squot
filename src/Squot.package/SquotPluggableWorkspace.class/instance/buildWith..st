toolbuilder
buildWith: builder
	^ (self buildCodePaneWith: builder)
		minimumHeight: (self minHeightWith: builder);
		yourself