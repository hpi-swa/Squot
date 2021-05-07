private
undo
	originalRemote addTo: repository git.
	self notifyRollback.