Squot repository
createNewVersionFromPatch: aPatch with: aBlock
	| newId newVersion newSnapshot |
	newId := ({0}, (self versionsDirectory entries collect: [:each | each basename asInteger])) max + 1.
	newVersion := SquotFileTestVersion named: newId asString in: self.
	aBlock value: newVersion.
	newSnapshot := newVersion storeTreeAndApply: aPatch.
	^ SquotMemoizingVersion version: newVersion snapshot: newSnapshot