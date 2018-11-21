accessing
include
	isActive ifTrue: [^ self].
	isActive := true.
	includeBlock value.