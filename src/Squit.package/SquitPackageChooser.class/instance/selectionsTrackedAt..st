accessing
selectionsTrackedAt: aNumber

	aNumber = 1 ifTrue: ["title" ^ false].
	
	^ selectedTrackedPackages includes: (self trackedPackages at: aNumber - 1)