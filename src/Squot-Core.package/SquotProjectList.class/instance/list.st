toolbuilder
list
	^ SqueakWorkingCopy registeredNames sorted
		ifEmpty: [{'Right click here'. 'to add a project'}
					collect: [:each | SquotTextUtilities italic: each]]