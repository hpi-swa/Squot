public-accessing
entryAt: aName ifPresent: presentBlock ifAbsent: absentBlock
	^ entries 
		at: aName
		ifPresent: presentBlock
		ifAbsent: absentBlock