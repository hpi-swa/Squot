self-updating
postInstallVersion: aString
	self installedVersion: (self getShaOfVersion: aString).