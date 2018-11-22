as yet unclassified
applyToContainer: anObjectContainer

	self flag: #TODO.
	self halt.
	self added do: [:each | self createFile: each].
	self removed do: [:each | self deleteFile: each].