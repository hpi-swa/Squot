toolbuilder
list
	^ SqueakWorkingCopy registeredNames sorted
		ifEmpty: [{SquotTextUtilities italic: 'Right click here to add a project'}]