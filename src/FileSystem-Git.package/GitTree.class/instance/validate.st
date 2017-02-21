validation
validate
	super validate.
	self entries do: [:entry| entry validate].