Squot repository
createNewVersion: aSnapshot with: aBlock
	"Build a new version with aSnapshot as its snapshot and supply the new version or a
	builder object for it to aBlock, during which additional properties can be set up.
	When aBlock returns here, store the new version permanently."
	| newId newVersion |
	newId := (({0}, (self versionsDirectory entries collect: [:each | each basename asInteger]))
				sort; last) + 1.
	newVersion := SquotFileTestVersion named: newId asString in: self.
	newVersion
		ensureDirectory;
		timestamp: DateAndTime now.
	aBlock value: newVersion.
	newVersion store: aSnapshot.
	^ newVersion