git-operations
fetch: aString
	self handleCredentialsDuring: [
		self fsgitRepository fetchFrom: aString].