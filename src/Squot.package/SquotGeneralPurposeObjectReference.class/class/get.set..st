instance creation
get: getBlock set: setBlock
	^ self new
		getBlock: getBlock;
		setBlock: setBlock;
		yourself