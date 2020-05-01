accessing
updateRef: nameString to: valueString
	"Update the ref to hold the given value. Usually valueString will be a hex hash. But this can be used to craft symbolic references as well: to create a symbolic ref, valueString must start with 'ref: ' and continue with another full ref name."
	^ self subclassResponsibility