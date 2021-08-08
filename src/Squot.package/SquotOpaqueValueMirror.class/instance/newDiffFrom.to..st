comparing
newDiffFrom: aSquotPrimitiveValue to: aSquotPrimitiveValue2
	"Usually this is only called when comparing two SquotTrackedObjectMetadata values. This answer may not actually be correct in that case, but SquotTrackedObjectMetadata does not use the diffs returned from here anyway, so better use a singleton instead of creating an accurate wasted diff."
	^ SquotDiffOfEqualObjects instance