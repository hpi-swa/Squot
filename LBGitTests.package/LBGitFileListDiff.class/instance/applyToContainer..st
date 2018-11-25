as yet unclassified
applyToContainer: anObjectContainer

	self added do: [:each | self createFile: each].
	self modified do: [:each | self updateFile: each].
	self removed do: [:each | self deleteFile: each].