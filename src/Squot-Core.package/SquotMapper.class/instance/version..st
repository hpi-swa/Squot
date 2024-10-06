accessing
version: aNumber
	aNumber > self class currentVersion ifTrue: [^ SquotBrowser errorOutdated].
	self basicVersion: aNumber.