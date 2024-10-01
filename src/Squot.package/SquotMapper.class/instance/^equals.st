comparing
= anObject
	"ignore version"
	^ self class == anObject class and: [self isTracked = anObject isTracked]