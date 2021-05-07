accessing
className
	^ (snapshot definitions detect: [:each | each respondsTo: #actualClass]) className