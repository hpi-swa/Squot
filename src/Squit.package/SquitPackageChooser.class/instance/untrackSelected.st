actions
untrackSelected

	self selectedUntrackedPackages removeAll.
	self changed: #selectedUntrackedPackages.
	
	self selectedTrackedPackages do: [:package |
		self untrack: package]