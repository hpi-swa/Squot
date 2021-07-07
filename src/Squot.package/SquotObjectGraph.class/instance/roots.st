patching
roots
	| roots |
	roots := LinkedList new.
	self hasObjects ifTrue: [roots add: self startObject].
	startShadow ifNotNil: [roots add: startShadow].
	^ roots