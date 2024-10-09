accessing
version: aNumber
	aNumber > self class currentVersion ifTrue: [^ GSBrowser errorOutdated].
	self basicVersion: aNumber.