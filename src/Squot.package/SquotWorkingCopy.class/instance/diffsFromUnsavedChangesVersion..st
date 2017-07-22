switching historians
diffsFromUnsavedChangesVersion: aVersion
	aVersion ifNil: [^ #()].
	^ (aVersion patchRelativeToBase: aVersion parents first) diffs