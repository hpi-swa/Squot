actions
actionCommit
	self projectSelection saveNewVersionInteractivelyIfCanceled: [^ self].
	self refresh.