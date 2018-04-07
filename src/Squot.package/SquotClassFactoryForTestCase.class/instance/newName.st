creating
newName
	| postFix |
	postFix := (self createdClasses size + 1) printString.
	^#ClassForSquotTestToBeDeleted, postFix