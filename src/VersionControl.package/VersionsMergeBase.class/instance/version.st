accessing
version
	^ (self commonAncestors ifEmpty: [^ nil]) anyOne