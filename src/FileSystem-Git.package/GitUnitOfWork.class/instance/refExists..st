testing
refExists: fullRef
	^ refStores anySatisfy: [:each | each includes: fullRef]