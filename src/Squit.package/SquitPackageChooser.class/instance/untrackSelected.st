actions
untrackSelected

	self selectedTrackedPackages do: [:package |
		self untrack: package]