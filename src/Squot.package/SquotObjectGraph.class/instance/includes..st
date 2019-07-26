testing
includes: anObjectOrShadow
	^ (objects includes: anObjectOrShadow) or: [super includes: anObjectOrShadow]