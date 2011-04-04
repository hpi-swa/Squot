class initialization
startUp: resuming
	resuming
		ifFalse: [ ^ self ].
	Resolver := FSInteractiveResolver new.
	Resolver addResolver: FSSystemResolver new.
	Resolver addResolver: FSPlatformResolver forCurrentPlatform