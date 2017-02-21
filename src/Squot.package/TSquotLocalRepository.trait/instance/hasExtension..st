Squot repository extensions
hasExtension: extensionId
	^ self extension: extensionId ifPresent: [true] ifAbsent: [false]