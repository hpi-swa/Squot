navigating
/ aString
	| path |
	path := self class new: self size + 1.
	path copyFrom: self.
	path at: path size put: aString.
	^ path