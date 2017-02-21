visiting
visitDirectory: aDirectoryReference
	(ignoredPaths includes: aDirectoryReference path) ifTrue: [^ self].
	aDirectoryReference entries do: [:each | self visit: each reference].