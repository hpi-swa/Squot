adding
add: anObject reachedVia: aReference
	self add: anObject path: (self currentPath copyWith: aReference).