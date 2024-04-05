accessing
activeRefIfNilInformAnd: aBlock
	self activeWorkingCopyIfNilInformAnd: aBlock.
	^ self activeRef ifNil: [
		self inform: 'Please select a ref first.'.
		aBlock value]