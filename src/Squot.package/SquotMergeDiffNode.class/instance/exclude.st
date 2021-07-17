accessing
exclude
	choice == #left ifTrue: [^ self].
	isActive := false.
	excludeBlock value.
	choice := #left.