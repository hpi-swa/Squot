private
updateEntryFrom: aRelativePath
	"Replace an existing entry with up-to-date data or add a new one in the correct place"
	| reference searchEntry |
	reference := workingCopyDir resolve: aRelativePath.
	searchEntry := GitIndexEntry fromPath: aRelativePath in: workingCopyDir.
	entries
		findBinary: searchEntry compareWithEach
		do: [:existing | existing updateFromReference: reference]
		ifNone: [newEntries add: searchEntry].