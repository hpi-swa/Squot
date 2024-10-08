actions
workingCopyAction: aBlock
	self activeWorkingCopy ifNil: [
		self inform: 'Please select a project first.'.
		^ self].
	aBlock value: self activeWorkingCopy.