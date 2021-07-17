as yet unclassified
requestProjectName

	name := SquotGUI request: 'Project name:'.
	name ifEmpty: [name := nil].
	^ name