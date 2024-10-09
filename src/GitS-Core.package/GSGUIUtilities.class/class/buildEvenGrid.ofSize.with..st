toolbuilder
buildEvenGrid: aCollection ofSize: aPoint with: builder
	^ self
		buildGrid: aCollection
		horizontalSplits: ((1 to: aPoint x - 1) collect: [:each | each / aPoint x])
		verticalSplits: ((1 to: aPoint y - 1) collect: [:each | each / aPoint y])
		with: builder