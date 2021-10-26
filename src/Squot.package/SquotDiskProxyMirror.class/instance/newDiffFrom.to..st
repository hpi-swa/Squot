comparing
newDiffFrom: aDiskProxyShadow to: aDiskProxyShadow2
	self isThisEverCalled.
	"Should only be called if the DiskProxies were the roots of the object graph (which would not make much sense, to track something that is then proxied to hide any details). Otherwise, if the DiskProxy is different, the target of the reference from which it was reached is also likely to have a different identity, so the DiskProxy versions would not be compared with each other."
	^ aDiskProxyShadow = aDiskProxyShadow2
		ifTrue: [SquotDiffOfEqualObjects instance]
		ifFalse: [self isThisEverCalled. SquotObjectReplacement left: aDiskProxyShadow right: aDiskProxyShadow2]