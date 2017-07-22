utilities
assertVersion: aVersion containsMethod: aCompiledMethod
	| artifact |
	artifact := self assertVersion: aVersion containsClass: aCompiledMethod methodClass.
	artifact packageArtifactDefinitions detect: [:each | each isMethodDefinition
			and: [(each className = aCompiledMethod methodClass name)
			and: [(each selector = aCompiledMethod selector)
			and: [each source asString = aCompiledMethod getSource asString]]]]
		ifNone: [self fail: 'Method not found'].