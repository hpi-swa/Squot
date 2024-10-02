testing
path: aPath collidesWithAnyOf: aCollection
	^ aCollection anySatisfy: [:each | self path: aPath collidesWith: each]