instance creation
withTitle: titleString name: nameString url: urlString
	^ (self withTitle: titleString)
		remoteName: nameString;
		remoteUrl: urlString;
		yourself