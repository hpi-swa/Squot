adding
addPackage: aPackage at: aString
	| mczPath stream version |
	version := (MCWorkingCopy forPackage: aPackage)
					newVersionWithName: aPackage name
					message: 'Created by git/s for an export to a .sar'.
	stream := RWBinaryOrTextStream on: (String new: 10000).
	version fileOutOn: stream.
	mczPath := GSPathUtilities asRelativeString: aString, '.mcz'.
	self
		addUncompressedString: stream contents at: mczPath; "mcz is already compressed"
		addPreambleLine: ('self fileInMonticelloZipVersionNamed: {1}.'
								format: {mczPath printString}).