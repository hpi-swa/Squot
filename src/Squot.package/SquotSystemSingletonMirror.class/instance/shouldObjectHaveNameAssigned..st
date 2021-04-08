testing
shouldObjectHaveNameAssigned: aBooleanOrNil
	"The system singletons do not get a name to retrieve them from graphs, since they are available everywhere in the pseudo variables true, false and nil."
	^ false