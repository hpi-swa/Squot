actions
trackSelected

	self selectedUntrackedPackages do: [:package | 
		self track: package].