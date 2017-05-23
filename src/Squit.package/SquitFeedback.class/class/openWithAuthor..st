as yet unclassified
openWithAuthor: aString
	| instance |
	instance := self new.
	instance actionAuthor: aString.
	ToolBuilder open: instance.