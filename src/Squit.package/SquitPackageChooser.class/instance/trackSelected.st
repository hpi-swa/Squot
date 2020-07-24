actions
trackSelected

	| package conflictingPackages |
	package := (self untrackedPackagesWithTitle at: self selectionUntracked).
	
	conflictingPackages := self trackedPackages select: [:p | p beginsWith: package].
	
	conflictingPackages ifNotEmpty: [
		(self confirm: 'To add this package, we will first remove ',
			(conflictingPackages joinSeparatedBy: ', '),
			', because the new packages is a prefix/super package for these.', String cr,
			'(Otherwise the package contents will be duplicated)') ifFalse: [^ self]].
	
	self trackedPackages
		removeAll: conflictingPackages;
		add: package.
	
	self updateUntrackedPackages.
	
	self changed: #trackedPackagesWithTitle.
	self changed: #untrackedPackagesWithTitle.
	self changed: #hasUntrackedSelection.
	self changed: #hasTrackedSelection