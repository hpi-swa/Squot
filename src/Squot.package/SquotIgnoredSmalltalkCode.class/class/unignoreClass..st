accessing
unignoreClass: aSymbol
	"Stop ignoring all changes to the class with the given name."
	| changeSet class |
	changeSet := self changeSet.
	class := Environment current classNamed: aSymbol.
	"Evict the removal of the class from the changeset, see ignoreClass:"
	((changeSet classChangeAt: aSymbol) includes: #remove) ifFalse: ["not ignored" ^ self].
	changeSet removeClassChanges: class.