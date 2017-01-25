accessing
objectClassName
	| contents end |
	contents := self fileContents.
	end := contents indexOfSubCollection: ' -> '.
	^ contents copyFrom: 1 to: end - 1