actions
newProject: aWorkingCopy
	aWorkingCopy ifNil: [^ self].
	self activeWorkingCopy: aWorkingCopy.
	aWorkingCopy import.
	aWorkingCopy headCommit ifNotNil: [
		(self confirm: 'Do you want to load the current commit into the image?') ifTrue: [
			self openDialogToMaterializeHead]].