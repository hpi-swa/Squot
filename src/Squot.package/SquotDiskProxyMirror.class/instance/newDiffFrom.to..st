comparing
newDiffFrom: aDiskProxyShadow to: aDiskProxyShadow2
	^ aDiskProxyShadow = aDiskProxyShadow2
		ifTrue: [SquotDiffOfEqualObjects instance]
		ifFalse: [self isThisEverCalled. SquotObjectReplacement left: aDiskProxyShadow right: aDiskProxyShadow2]