private
findOrCreateMaterializedInstanceOf: aShadow reflectedIn: aMirror ifNew: aBlock
	"Answers a live (but not necessarily reactivated) object. Its references may not all be updated in yet."
	| existing materialized |
	self sourceNameOf: aShadow
		ifPresent:
			[:name |
			existing := objectRegistry objectNamed: name ifAbsent: [].
			(existing notNil and: [existing squotShouldKeepIdentity])
				ifTrue: [materialized := existing]]
		ifAbsent: [].
	materialized ifNil:
		[materialized := aShadow squotMaterializeWith: self.
		aBlock value: materialized].
	"The references of anObject are not yet filled in here. Also the object does not get activated yet."
	^ materialized