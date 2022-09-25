accessing artifacts
readArtifact: anArtifact 
	| className class graph |
	className := self classNameOf: anArtifact.
	class := environment classNamed: className.
	class isMeta ifTrue: [self error: 'Should capture class, not metaclass'].
	graph := SquotShadowGraph withSingleShadow:
		(SquotClassShadow
			forPackageNamed: class category
			withSnapshot: (self monticelloSnapshot: class)).
	^ SquotArtifactSnapshot artifact: anArtifact objectSnapshot: graph