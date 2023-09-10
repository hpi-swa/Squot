accessing
operations
	^ self changes collect: #operation thenSelect: #notNil