comparing
patchRelativeToBase: aProjectSnapshot
	| merge |
	merge := (SquotProjectSnapshot fromStore: self) patchRelativeToBase: aProjectSnapshot.
	^ merge