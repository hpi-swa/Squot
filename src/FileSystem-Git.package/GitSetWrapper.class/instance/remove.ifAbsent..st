removing
remove: anObject ifAbsent: aBlock
	set remove: anObject ifAbsent: aBlock.
	"maxDepth might be too high from now on"