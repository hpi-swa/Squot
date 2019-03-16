tests
testTonelToCypress
	| originalPath newPath directoryDepth |
	workingCopy artifacts anyOne serializer: SquotTonelSerializer.
	originalPath := workingCopy artifacts anyOne path.
	directoryDepth := originalPath occurrencesOf: $/.
	workingCopy saveNewVersionMessage: 'write as Tonel' interactive: false.
	self deny: ((workingCopy baseVersion snapshotDirectory / 'src') entries
					includes: classFactory packageName, '.package')
		description: 'Cypress directory exists'.
	workingCopy artifacts anyOne serializer: SquotCypressCodeSerializer.
	self assert: 1 equals: workingCopy artifacts size description: 'duplicate artifacts'.
	newPath := workingCopy artifacts anyOne path.
	workingCopy saveNewVersionMessage: 'convert to Cypress' interactive: false.
	self deny: ((workingCopy baseVersion snapshotDirectory / 'src') entries
					includes: classFactory packageName)
		description: 'Tonel directory still exists'.
	self deny: originalPath equals: newPath.
	self assert: directoryDepth
		equals: (newPath occurrencesOf: $/)
		description: 'Profileration of subdirectories'.
	self assert: 1 equals: directoryDepth description: 'Too many subdirectories'.