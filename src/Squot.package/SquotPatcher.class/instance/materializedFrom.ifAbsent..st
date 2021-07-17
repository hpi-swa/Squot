public
materializedFrom: aShadow ifAbsent: aBlock
	^ treatedObjects at: aShadow undecorated ifAbsent: aBlock