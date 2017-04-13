testing
refExists: fullRef
	^ (self baseDir resolve: fullRef) isFile