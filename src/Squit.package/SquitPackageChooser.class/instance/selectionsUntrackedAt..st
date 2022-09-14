accessing
selectionsUntrackedAt: aNumber

	aNumber = 1 ifTrue: ["title" ^ false].
	^ selectedUntrackedPackages includes: (self untrackedPackages at: aNumber - 1)