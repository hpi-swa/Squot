accessing
unignoreClass: aSymbol
	"Stop ignoring all changes to the class with the given name."
	| changeSet class |
	changeSet := self changeSet.
	class := Environment current classNamed: (self symbolInChangeSet: aSymbol).
	"Evict the removal of the class from the changeset, see ignoreClass:"
	changeSet removeClassChanges: class.