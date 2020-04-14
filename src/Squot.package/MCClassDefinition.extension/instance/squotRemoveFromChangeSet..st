*Squot-Tools
squotRemoveFromChangeSet: aChangeSet 
	"Remove the class definition change, but preserve all selectors recorded."
	| class selectors |
	selectors := aChangeSet selectorsInClass: self className.
	aChangeSet removeClassChanges: self className.
	class := self actualClass.
	selectors do: [:each | aChangeSet adoptSelector: each forClass: class]