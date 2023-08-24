as yet unclassified
merge
	self
		merge: self left
		with: self right
		base: self base
		into: self result
		at: FSPath workingDirectory.