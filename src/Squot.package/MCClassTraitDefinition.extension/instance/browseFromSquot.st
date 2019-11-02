*Squot-tools
browseFromSquot
	^ (Environment current classOrTraitNamed: self baseTrait, ' classTrait')
		ifNotNil: [:classTrait | classTrait browse]
		ifNil: [(MCOperationsList operations: {MCAddition of: self}) browse]
		