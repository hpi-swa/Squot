initialize-release
initialize
	message := SquotInitialLogMessageRequested new signal ifNil: 'Enter commit log message here'.
