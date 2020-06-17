running
cancel
	super cancel.
	promise rejectWith: #cancelled.