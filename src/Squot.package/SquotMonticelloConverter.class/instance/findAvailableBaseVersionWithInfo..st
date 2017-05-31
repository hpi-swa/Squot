private
findAvailableBaseVersionWithInfo: baseMCVersionInfo
	| baseInfo baseMcVersion |
	baseInfo := baseMCVersionInfo ifNil: [^ nil].
	[(baseMcVersion := monticelloRepository versionWithInfo: baseMCVersionInfo) isNil]
		whileTrue: [baseInfo := (baseInfo ancestors ifEmpty: [^ nil]) first].
	^ baseMcVersion