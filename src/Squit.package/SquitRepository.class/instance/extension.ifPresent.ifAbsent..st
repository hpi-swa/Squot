Squot repository extensions
extension: extensionId ifPresent: presentBlock ifAbsent: absentBlock
	^ extensionId caseOf: {
		[#authorInformation] -> [presentBlock value: self].
		[#filesystem] -> [presentBlock value: self filesystemExtension].
	} otherwise: [absentBlock value]