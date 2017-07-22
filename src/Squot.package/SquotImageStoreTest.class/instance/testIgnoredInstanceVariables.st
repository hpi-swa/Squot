tests
testIgnoredInstanceVariables
	| morph previousOwner shadow graph submorph |
	morph := Morph new.
	submorph := Morph new.
	morph addMorph: submorph.
	morph openInWorld.
	previousOwner := morph owner.
	imageStore add: morph at: 'morph'.
	graph := (imageStore artifactAt: 'morph') content.
	shadow := graph startShadow.
	self assert: shadow originalClass == morph class description: 'pick correct shadow'.
	self deny: (shadow includesSlot: 'owner').
	self assert: morph owner == previousOwner description: 'capturing should not affect state of the captured object'. "(except if the class wants it... see Morph>>prepareToBeSaved)"
	self assert: ((graph shadowNamed: (imageStore objectRegistry nameOf: submorph)) includesSlot: 'owner')
		description: 'instance variable exclusion is instance specific'.
	morph delete.