accessing
activeWorkingCopyIfNilInformAnd: aBlock
	^ self activeWorkingCopy ifNil: [
		self inform: 'Please select a project first.'.
		aBlock value]