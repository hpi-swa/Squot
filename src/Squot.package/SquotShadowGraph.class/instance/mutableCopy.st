copying
mutableCopy
	^ SquotMutableObjectGraph new
		copySameFrom: self;
		postCopy;
		yourself