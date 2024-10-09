toolbuilder
buildGrid: aCollection horizontalSplits: horizontalSplits verticalSplits: verticalSplits with: builder
	| children width height hSplits vSplits |
	children := self children: aCollection.
	width := horizontalSplits size + 1.
	height := verticalSplits size + 1.
	self assert: width * height = children size.
	hSplits := {0}, horizontalSplits, {1}.
	vSplits := {0}, verticalSplits, {1}.
	^ self buildLayout: (Array streamContents: [:stream |
		hSplits overlappingPairsWithIndexDo: [:hFrom :hTo :hIndex |
			vSplits overlappingPairsWithIndexDo: [:vFrom :vTo :vIndex |
				stream nextPut:
					(LayoutFrame fractions: (hFrom @ vFrom corner: hTo @ vTo))
						-> (children at: ((vIndex - 1) * width) + hIndex)]]])
		with: builder