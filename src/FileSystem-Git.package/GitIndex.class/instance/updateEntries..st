operations
updateEntries: aCollectionOfRelativePaths
	"Update index from the actual files in the working copy"
	workingCopyDir := repository workingCopyDir.
	newEntries := OrderedCollection new.
	aCollectionOfRelativePaths do: [:each | self updateEntryFrom: each].
	entries addAll: newEntries.
	entries sort.
	newEntries := nil.