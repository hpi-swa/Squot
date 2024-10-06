accessing
operations
	^ (self changes select: #isIncluded) collect: #operation thenSelect: #notNil