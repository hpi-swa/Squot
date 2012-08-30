*FileSystem-Git-Monticello
simplifyMethodRemovals
	self classRemovals do: [ :classRemoval|
		self removeMethodsOfClass: classRemoval definition className].