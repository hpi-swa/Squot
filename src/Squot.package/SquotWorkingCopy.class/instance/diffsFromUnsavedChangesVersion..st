switching historians
diffsFromUnsavedChangesVersion: aVersion
	aVersion ifNil: [^ #()].
	^ aVersion parents first snapshot diffsAgainst: aVersion snapshot