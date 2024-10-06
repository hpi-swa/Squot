sar
requestSarFileName
	^ UIManager default
		saveFilenameRequest: ('Export the project {1} to a .sar' format: {self name})
		initialAnswer: self name, '.sar'