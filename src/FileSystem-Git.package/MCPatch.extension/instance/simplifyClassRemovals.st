*FileSystem-Git-Monticello
simplifyClassRemovals
	self packageRemovals do: [ :packageRemoval|
		operations remove: packageRemoval.
		self removeMethodsOfClass: packageRemoval definition className].