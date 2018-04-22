actions
untrackSelected

	| package |
	package := (self trackedPackages at: self selectionTracked).
	self trackedPackages remove: package.
	
	self updateUntrackedPackages.
	
	self changed: #trackedPackages.
	self changed: #untrackedPackages.
	self changed: #hasTrackedSelection.
	self changed: #hasUntrackedSelection