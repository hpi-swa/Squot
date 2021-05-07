verification
updates
	^ (accesses select: [:each | each first = #update]) collect: [:each | each second]