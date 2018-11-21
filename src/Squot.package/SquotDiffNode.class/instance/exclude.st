accessing
exclude
	isActive ifFalse: [^ self].
	isActive := false.
	excludeBlock value.