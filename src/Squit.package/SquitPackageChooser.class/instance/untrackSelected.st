actions
untrackSelected

	| package |
	package := (self trackedPackagesWithTitle at: self selectionTracked).
	self trackedPackages remove: package.
	
	self updateUntrackedPackages.
	
	self changed: #trackedPackagesWithTitle.
	self changed: #untrackedPackagesWithTitle.
	self changed: #hasTrackedSelection.
	self changed: #hasUntrackedSelection