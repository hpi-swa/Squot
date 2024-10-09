initialization
setItem: aString
	| name |
	super setItem: aString.
	name := GitReference shortName: aString.
	self isSqueakBranch ifFalse: [
		name := GSTextUtilities colorText: name with: Color gray].
	self string: name.