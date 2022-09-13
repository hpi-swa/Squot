actions
selectAllUntrackedPackages

	self selectedUntrackedPackages addAll: self untrackedPackages.
	self changed: #selectionsUntrackedAt:.