tests
testCherryPickPreservesAuthor
	| master otherHistorian |
	workingCopy saveVersionWithMessage: 'empty start'.
	master := workingCopy loadedHistorian.
	self assert: workingCopy baseVersion author = workingCopy defaultAuthor;
		deny: workingCopy defaultAuthor = 'someone else'.
	otherHistorian := repository historianNamed: 'other'.
	self assert: otherHistorian ~= master.
	otherHistorian version: workingCopy baseVersion.
	workingCopy add: Object new at: 'object'.
	workingCopy newSaveOperation message: 'add object';
		author: 'someone else';
		applyToWorkingCopy.
	self assert: workingCopy baseVersion author = 'someone else'.
	workingCopy switchTo: otherHistorian.
	workingCopy newCherryPickOperation 
		pickedVersion: master version;
		relevantParentOfPickedVersion: master version parents first;
		applyToWorkingCopy.
	self assert: 'someone else' equals: workingCopy baseVersion author.