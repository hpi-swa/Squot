patching
add: aSquotArtifact
	 | path dependencies insertIndex |
	"Note the addition and insert after all items that precede it in the incoming order."
	path := aSquotArtifact path.
	self assert: (editedWorking includes: path) not.
	containerModifications at: path put: #add.
	dependencies := ((incoming copyUpTo: path) intersection: editedWorking) asSet.
	insertIndex := 1.
	[dependencies notEmpty] whileTrue:
		[dependencies remove: (editedWorking at: insertIndex) ifAbsent: [].
		insertIndex := insertIndex + 1].
	editedWorking add: path beforeIndex: insertIndex.
	self resetResolution.