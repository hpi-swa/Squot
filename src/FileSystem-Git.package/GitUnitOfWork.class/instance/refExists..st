testing
refExists: fullRef
	^ refCache
		refExists: fullRef
		ifNotLookedUp: [refStores anySatisfy: [:each | each includes: fullRef]]