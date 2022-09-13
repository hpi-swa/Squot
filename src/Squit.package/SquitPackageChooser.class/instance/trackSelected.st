actions
trackSelected

	| newPackages |
	newPackages := self selectedUntrackedPackages asOrderedCollection.
	
	"Remove all conflicts from the selection by selecting all roots from the tree only."
	"Naive O(n**2) implementation. Yeah, there are fancy O(n log n) algos for this, but for N < 1000 this really seems not worth the effort."
	newPackages := newPackages select: [:root |
		newPackages noneSatisfy: [:child |
			child ~= root and: [
				(PackageInfo new packageName: child; includesSystemCategory: root)]]].
	
	"Unselect children to be tracked (roots will be unselected by #track: below)"
	selectedUntrackedPackages removeAllSuchThat: [:each |
		(newPackages includes: each) not].
	self changed: #selectedUntrackedPackages.
	
	newPackages do: [:package | 
		self track: package].