converting
findOrCreateAndRematerialize: aShadow reflectedIn: aMirror
	| existing materialized |
	self sourceNameOf: aShadow ifPresent: [:name |
		existing := objectRegistry objectNamed: name ifAbsent: [].
		(existing notNil and: [existing squotShouldKeepIdentity])
			ifTrue: [materialized := existing]].
	materialized ifNil: [materialized := aShadow squotMaterializeWith: self].
	"The references of anObject are not yet filled in here. Also the object does not get activated yet."
	^ materialized