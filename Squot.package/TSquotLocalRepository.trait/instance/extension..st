Squot repository extensions
extension: extensionId
	self extension: extensionId
		ifPresent: [:it | ^ it]
		ifAbsent: [].
	^ (KeyNotFound key: extensionId) signal