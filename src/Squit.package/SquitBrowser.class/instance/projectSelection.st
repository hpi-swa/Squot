accessing
projectSelection
	self projectIndex > 1 ifFalse: [^ nil].
	^ self projectList at: self projectIndex ifAbsent: [nil]