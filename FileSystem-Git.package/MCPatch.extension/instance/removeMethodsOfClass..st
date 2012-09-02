*FileSystem-Git-Monticello
removeMethodsOfClass: aClassName
	self methodRemovals do: [ :methodOperation|
		methodOperation definition className == aClassName
			ifTrue: [operations remove: methodOperation]]