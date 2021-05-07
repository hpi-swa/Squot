*Squot-Tools
actualClassIn: anEnvironment
	^ (anEnvironment classNamed: self baseTrait) ifNotNil: [:trait | trait classTrait]