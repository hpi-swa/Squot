running
setUp
	super setUp.
	
	repository := self newRepository.
	verifier := SquotMonticelloConverterVerifier new.
	classFactory := ClassFactoryForTestCase new.