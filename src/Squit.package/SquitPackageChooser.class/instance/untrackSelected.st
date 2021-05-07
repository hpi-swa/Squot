actions
untrackSelected

	| package |
	package := (self trackedPackagesWithTitle at: self selectionTracked).
	self trackedPackages remove: package.
	
	self updateUntrackedPackages.
	
	self changed: #trackedPackagesWithTitle.
	self changed: #untrackedPackagesWithTitle.
	selectionTracked ifNotNil:
		[selectionTracked := selectionTracked min: trackedPackages size + 1.
		self changed: #selectionTracked].
	self changed: #hasTrackedSelection.
	self changed: #hasUntrackedSelection.
	