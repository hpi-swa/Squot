comparing
isEquivalentTo: anArtifact
	"Try to figure out if me and the other artifact have enough in common to justify a merge, even if our identifiers differ."
	| package other |
	((package := storeInfo firstReferenceOfType: 'package' ifNone: []) notNil
		and: [(other := anArtifact storeInfo firstReferenceOfType: 'package' ifNone: []) notNil])
		ifTrue:
			[(package value at: 'packageName') = (other value at: 'packageName')
				ifTrue: [^ true]].
	^ false