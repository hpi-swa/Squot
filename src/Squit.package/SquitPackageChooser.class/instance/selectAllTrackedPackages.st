actions
selectAllTrackedPackages

	self selectedTrackedPackages addAll: self trackedPackages.
	self changed: #selectionsTrackedAt:.