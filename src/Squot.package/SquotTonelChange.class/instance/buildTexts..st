toolbuilder
buildTexts: builder
	^ (1 to: self sourcesSize) collect: [:index | self buildText: index with: builder]