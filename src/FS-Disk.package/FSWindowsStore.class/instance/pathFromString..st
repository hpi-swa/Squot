converting
pathFromString: aString
	"Need to distinguish '' and '/' , so tag latter with invalid character ':'  "
	| normalized pathClass pathElements |
	normalized := aString copy replaceAll: FSUnixStore delimiter with: self delimiter.
	pathElements := normalized splitBy: self delimiter asString.
	pathClass := (Path isAbsoluteWindowsPath: normalized)
		ifTrue: [ (normalized = self delimiter asString) ifTrue: [ pathElements := { ':' } ].
			FSAbsolutePath ]
		ifFalse: [ self stripDrive: pathElements.
			FSRelativePath ].
	^pathClass withAll: (pathClass canonicalizeElements: pathElements).