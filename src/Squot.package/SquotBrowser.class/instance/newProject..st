actions
newProject: aWorkingCopy
	| headCommit |
	aWorkingCopy ifNil: [^ self].
	self activeWorkingCopy: aWorkingCopy.
	headCommit := aWorkingCopy headCommit.
	headCommit ifNotNil: [
		(self confirm: 'Do you want to load the current commit into the image?') ifTrue: [
			self openDialogToMaterializeHead]].