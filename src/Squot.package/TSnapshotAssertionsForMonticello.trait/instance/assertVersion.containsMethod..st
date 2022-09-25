utilities
assertVersion: aVersion containsMethod: aCompiledMethod
	| artifact packageShadow |
	artifact := self assertVersion: aVersion containsClass: aCompiledMethod methodClass.
	packageShadow := SquotToggles useNewApi ifTrue: [(aVersion snapshot snapshotArtifact: artifact) objectSnapshot startShadow] ifFalse: [artifact content startShadow].
	packageShadow definitions detect: [:each | each isMethodDefinition
			and: [(each className = aCompiledMethod methodClass name)
			and: [(each selector = aCompiledMethod selector)
			and: [each source asString = aCompiledMethod getSource asString]]]]
		ifNone: [self fail: 'Method not found'].