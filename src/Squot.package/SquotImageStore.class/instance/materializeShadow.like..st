private materializing
materializeShadow: objectShadow like: anObject
	^ SquotShadowMaterializer new
		registry: self objectRegistry;
		rematerialize: objectShadow