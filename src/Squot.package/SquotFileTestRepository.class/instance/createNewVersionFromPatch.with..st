Squot repository
createNewVersionFromPatch: aPatch with: aBlock
	"Build a new version with aPatch applied to the first parent version and supply the
	new version or a builder object for it to aBlock, during which additional properties
	can be set up. When aBlock returns here, store the new version permanently."
	| newId newVersion |
	newId := (({0}, (self versionsDirectory entries collect: [:each | each basename asInteger]))
				sort; last) + 1.
	newVersion := SquotFileTestVersion named: newId asString in: self.
	aBlock value: newVersion.
	newVersion storeTreeAndApply: aPatch.
	^ newVersion