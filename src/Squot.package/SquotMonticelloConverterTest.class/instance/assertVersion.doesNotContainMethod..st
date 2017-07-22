utilities
assertVersion: aVersion doesNotContainMethod: aCompiledMethod
	| artifact |
	artifact := self assertVersion: aVersion containsClass: aCompiledMethod methodClass.
	artifact packageArtifactDefinitions detect: [:each | each isMethodDefinition
			and: [(each className = aCompiledMethod methodClass name)
			and: [each selector = aCompiledMethod selector]]]
		ifNone: [^ self].
	self fail: 'method present, but should be absent'.