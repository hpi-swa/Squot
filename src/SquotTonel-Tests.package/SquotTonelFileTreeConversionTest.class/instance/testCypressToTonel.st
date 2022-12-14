tests
testCypressToTonel
	| originalPath newPath directoryDepth |
	self package serializer: SquotCypressCodeSerializer.
	originalPath := self package path.
	directoryDepth := originalPath occurrencesOf: $/.
	workingCopy saveVersionWithMessage: 'write as Cypress'.
	self deny: ((workingCopy baseVersion snapshotDirectory / 'src') entries
					includes: classFactory packageName)
		description: 'Tonel directory exists'.
	self package serializer: SquotTonelSerializer.
	self assert: 1 equals: (workingCopy artifacts select: #isLoaded) size description: 'duplicate artifacts'.
	newPath := self package path.
	workingCopy saveVersionWithMessage: 'convert to Tonel'.
	self deny: ((workingCopy baseVersion snapshotDirectory / 'src') entries
					includes: classFactory packageName, '.package')
		description: 'Cypress directory still exists'.
	self deny: originalPath = newPath description: ['Package path should have changed'].
	self assert: directoryDepth
		equals: (newPath occurrencesOf: $/)
		description: 'Profileration of subdirectories'.
	self assert: 1 equals: directoryDepth description: 'Too many subdirectories'.
	(workingCopy baseVersion snapshotDirectory / 'src' / '.properties') readStreamDo:
		[:stream | self assert: (stream upToEnd includesSubstring: '#tonel')].