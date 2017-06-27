*Squot-trackable
captureWithSquot
	"Use Monticello snapshot as shadow."
	self flag: #hack.
	^ self workingCopy package snapshot squotWithSortedDefinitions