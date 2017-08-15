Squot-shadow-diffing
squotAbsentContent
	"Answer an instance that can represent an absent package.
	Diffing the answer against me should result in a diff that reproduces me completely."
	self isThisEverCalled.
	^ self species forPackageNamed: packageName withSnapshot: MCSnapshot empty
		