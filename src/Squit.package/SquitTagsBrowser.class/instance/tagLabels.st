ui
tagLabels
	| prefixLength |
	prefixLength := 'refs/tags/' size.
	^ repository withUnitOfWork:
		[(repository tags collect: [:each | each name allButFirst: prefixLength]) sort]