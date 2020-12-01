private
updateLoadOrderFromVersion: aVersion
	"Update load order because some artifacts might move when stored in the repository. But do not remove added artifacts that were not saved yet, nor resurrect removed artifacts whose removal was not saved yet!"
	| loadOrder |
	loadOrder := self loadOrder.
	self loadOrder:
		((SquotLoadOrderMerge
			into: loadOrder
			merge: (aVersion loadOrder intersection: loadOrder)
			basedOn: (loadOrder intersection: aVersion loadOrder))
			resolvedPatch
				applyTo: loadOrder).