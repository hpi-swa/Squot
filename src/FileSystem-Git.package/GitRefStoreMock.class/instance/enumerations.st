verification
enumerations
	^ (accesses select: [:each | each first = #do]) collect: [:each | each second]