initialize-release
left: leftPackageShadow withSnapshot: leftMCSnapshot right: rightPackageShadow withSnapshot: rightMCSnapshot
	working := leftPackageShadow.
	incoming := rightPackageShadow.
	packageName := leftPackageShadow packageName.
	patch := rightMCSnapshot patchRelativeToBase: leftMCSnapshot.