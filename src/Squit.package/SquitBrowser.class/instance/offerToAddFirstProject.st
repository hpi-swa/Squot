actions
offerToAddFirstProject
	(self projectList size < 2 and: [
		(self confirm: 'Do you want to add your first project now?')])
			ifTrue: [self actionProjectAdd]