Squot-shadow-diffing
squotDiffAgainst: otherShadow with: aDiffBuilder
	"If the otherShadow is also a DiskProxy shadow, compare the constructors. Otherwise, exchange the objects."
	self deprecated: 'See SquotDiskProxyMirror newDiffFrom:to:'.
	^ self = otherShadow
		ifTrue: [SquotDiffOfEqualObjects instance]
		ifFalse: [SquotObjectReplacement left: self right: otherShadow]