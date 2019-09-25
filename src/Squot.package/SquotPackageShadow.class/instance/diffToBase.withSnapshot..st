comparing
diffToBase: aPackageShadow withSnapshot: aMCSnapshot
	^ SquotPackageDiff
		left: aPackageShadow withSnapshot: aMCSnapshot
		right: self withSnapshot: snapshot