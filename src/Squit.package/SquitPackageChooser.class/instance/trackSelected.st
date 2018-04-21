as yet unclassified
trackSelected

	| package |
	package := (self untrackedPackages at: self selectionUntracked).
	self untrackedPackages remove: package.
	self trackedPackages add: package.
	self changed: #trackedPackages.
	self changed: #untrackedPackages