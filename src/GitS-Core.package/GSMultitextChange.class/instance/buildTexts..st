toolbuilder
buildTexts: builder
	^ self sourceIndices collect: [:index | self buildTextFor: index with: builder]