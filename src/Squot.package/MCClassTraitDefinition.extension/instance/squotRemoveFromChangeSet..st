*Squot-Tools
squotRemoveFromChangeSet: aChangeSet 
	"Remove the class definition change, but preserve all selectors recorded."
	| class selectors |
	selectors := aChangeSet selectorsInClass: self squotName.
	aChangeSet removeClassChanges: self squotName.
	class := self actualClass.
	selectors do: [:each | aChangeSet adoptSelector: each forClass: class]