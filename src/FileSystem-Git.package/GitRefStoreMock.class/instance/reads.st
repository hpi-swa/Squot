verification
reads
	^ (accesses select: [:each | each first = #get]) collect: [:each | each second]