actions
selectInverseUntrackedPackages

	| nonSelected |
	nonSelected := self untrackedPackages difference: self selectedUntrackedPackages.
	self selectedUntrackedPackages
		removeAll;
		addAll: nonSelected.
	self changed: #selectionsUntrackedAt:.