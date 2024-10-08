actions-private
materializeNow
	self assert: self hasConflicts not.
	^ self
		basicMaterialize;
		done