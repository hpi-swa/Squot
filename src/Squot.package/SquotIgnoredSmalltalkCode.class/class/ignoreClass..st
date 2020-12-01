accessing
ignoreClass: aSymbol
	"Ignore all changes in the class with the given name."
	| changeSet class |
	changeSet := self changeSet.
	class := Environment current classNamed: (self symbolInChangeSet: aSymbol).
	"record a class removal, indicating that the whole class shall be ignored"
	changeSet noteRemovalOf: class.
