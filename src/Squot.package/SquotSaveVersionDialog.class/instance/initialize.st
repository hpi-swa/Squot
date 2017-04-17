initialize-release
initialize
	changeChooser := SquotChangedArtifactsChooser new.
	message := SquotInitialLogMessageRequested new signal ifNil: 'Enter commit log message here'.