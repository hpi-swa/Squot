verification
deletions
	^ (accesses select: [:each | each first = #delete]) collect: [:each | each second]