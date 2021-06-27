public
materializedFrom: aShadow ifPresent: presentBlock ifAbsent: absentBlock
	^ treatedObjects at: aShadow undecorated ifPresent: presentBlock ifAbsent: absentBlock