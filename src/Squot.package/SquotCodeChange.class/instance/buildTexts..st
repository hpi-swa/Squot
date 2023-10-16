toolbuilder
buildTexts: builder
	^ (1 to: self sourcesSize) collect: [:index | self buildTextFor: index with: builder]