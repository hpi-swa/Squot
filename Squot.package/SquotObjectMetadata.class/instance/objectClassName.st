accessing
objectClassName
	| contents end |
	contents := self fileContents.
	end := contents indexOf: $ .
	^ contents copyFrom: 1 to: end - 1