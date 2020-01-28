tests
testTonelToCypress
	| originalPath newPath directoryDepth |
	workingCopy artifacts anyOne serializer: SquotTonelSerializer.
	originalPath := workingCopy artifacts anyOne path.
	directoryDepth := originalPath occurrencesOf: $/.
	workingCopy saveVersionWithMessage: 'write as Tonel'.
	self deny: ((workingCopy baseVersion snapshotDirectory / 'src') entries
					includes: classFactory packageName, '.package')
		description: 'Cypress directory exists'.
	workingCopy artifacts anyOne serializer: SquotCypressCodeSerializer.
	self assert: 1 equals: workingCopy artifacts size description: 'duplicate artifacts'.
	newPath := workingCopy artifacts anyOne path.
	workingCopy saveVersionWithMessage: 'convert to Cypress'.
	self deny: ((workingCopy baseVersion snapshotDirectory / 'src') entries
					includes: classFactory packageName)
		description: 'Tonel directory still exists'.
	self deny: originalPath = newPath description: ['Package path should have changed'].
	self assert: directoryDepth
		equals: (newPath occurrencesOf: $/)
		description: 'Profileration of subdirectories'.
	self assert: 1 equals: directoryDepth description: 'Too many subdirectories'.