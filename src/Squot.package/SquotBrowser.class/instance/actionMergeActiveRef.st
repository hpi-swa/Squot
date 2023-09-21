actions
actionMergeActiveRef
	self activeRef ifNil: [^ self inform: 'Please select a ref first.'].
	self mergeRefIntoHead: self activeRef.