instance creation
left: leftPackageShadow withSnapshot: leftMCSnapshot 
right: rightPackageShadow withSnapshot: rightMCSnapshot
	^ self new
		left: leftPackageShadow withSnapshot: leftMCSnapshot 
		right: rightPackageShadow withSnapshot: rightMCSnapshot;
		yourself