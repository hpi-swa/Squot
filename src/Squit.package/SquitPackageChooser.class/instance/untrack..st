actions
untrack: aPackage

	self trackedPackages remove: aPackage.
	
	self updateUntrackedPackages.
	
	self updateUntrackedPackages.
	self changed: #trackedPackagesWithTitle.
	self changed: #untrackedPackagesWithTitle.
	selectionTracked ifNotNil:
		[selectionTracked := selectionTracked min: trackedPackages size + 1.
		self changed: #selectionTracked].
	selectedUntrackedPackages add: aPackage.
	selectedTrackedPackages remove: aPackage ifAbsent: [].
	self changed: #selectionsTrackedAt:.
	self changed: #selectionsUntrackedAt:.
	self changed: #hasTrackedSelections.
	self changed: #hasUntrackedSelections