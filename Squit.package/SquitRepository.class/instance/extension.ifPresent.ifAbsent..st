Squot repository extensions
extension: extensionId ifPresent: presentBlock ifAbsent: absentBlock
	^ extensionId caseOf: {
		[#authorInformation] -> [presentBlock value: self].
	} otherwise: [absentBlock value]