actions
selectInverseTrackedPackages

	| nonSelected |
	nonSelected := self trackedPackages difference: self selectedTrackedPackages.
	self selectedTrackedPackages
		removeAll;
		addAll: nonSelected.
	self changed: #selectionsTrackedAt:.