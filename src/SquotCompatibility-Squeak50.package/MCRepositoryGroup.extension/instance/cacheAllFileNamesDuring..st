*SquotCompatibility-Squeak50-private
cacheAllFileNamesDuring: aBlock
	^ (repositories
		inject: aBlock
		into: [ :innerBlock :repository |
			[ repository cacheAllFileNamesDuring: innerBlock ]
		]) value