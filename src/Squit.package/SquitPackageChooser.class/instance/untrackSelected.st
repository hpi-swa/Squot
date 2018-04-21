as yet unclassified
untrackSelected

	| package |
	package := (self trackedPackages at: self selectionTracked).
	self trackedPackages remove: package.
	self untrackedPackages add: package.
	self changed: #trackedPackages.
	self changed: #untrackedPackages