icon
coloredCommitIcon: aColor
	^ self
		cachedIcon: [:canvas |
			canvas drawImage: self commitIcon at: 0 @ 0.
			canvas form floodFill: aColor at: canvas clipRect center]
		cacheKey: thisContext sender method