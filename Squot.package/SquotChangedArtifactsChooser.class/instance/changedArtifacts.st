ui
changedArtifacts
	| effectiveArtifacts |
	effectiveArtifacts := list collect: [:eachAssociation | eachAssociation value].
	^ effectiveArtifacts collect: [:each | | state |
		state := self stateOf: each.
		state caseOf: {
			[#ignored] -> ['( ', each path, ' ) ignored'].
			[#changed] -> [each path, ' (edited)'].
			[#proposed] -> [each path].
			[#original] -> [Text string: '( ', each path, ' )'
					attributes: (self userInterfaceTheme ignoredOperationAttributes ifNil: [{TextColor gray}])].
		}]