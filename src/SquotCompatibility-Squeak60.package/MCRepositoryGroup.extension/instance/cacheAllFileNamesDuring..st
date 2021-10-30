*SquotCompatibility-Squeak60-private-override
cacheAllFileNamesDuring: aBlock
	^ (repositories
		inject: aBlock
		into: [ :innerBlock :repository |
			[ repository cacheAllFileNamesDuring: innerBlock ]
		]) value