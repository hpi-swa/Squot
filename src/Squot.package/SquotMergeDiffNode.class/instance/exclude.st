as yet unclassified
exclude
	choice == #left ifTrue: [^ self].
	isActive := false.
	excludeBlock value.
	choice := #left.