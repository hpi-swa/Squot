changes-operations
partsInChanges: aCollection
	^ aCollection collect: [:each |
			SquotChangesPart
				key: each
				path: (OrderedCollection withAll: self path)]