accessing
include
	choice == #right ifTrue: [^ self].
	isActive := true.
	includeBlock value.
	choice := #right.