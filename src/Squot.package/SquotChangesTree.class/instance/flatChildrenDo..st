accessing
flatChildrenDo: aBlock
	^ self children do: [:bucket | bucket do: aBlock]