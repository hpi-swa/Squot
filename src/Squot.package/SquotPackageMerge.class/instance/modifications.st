accessing
modifications
	^ containerModifications values, (containerConflicts values select: [:each | each remoteChosen] thenCollect: [:each | each operation])