class initialization
initializeSqueak53Compatibility
	"Squeak 5.3 and below do not have read-only objects."
	(Object canUnderstand: #beReadOnlyObject) ifFalse:
		[Object compile: 'beReadOnlyObject "Stub, do nothing. Created by ', thisContext, '"' classified: '*SquotCompatibility' withStamp: nil notifying: nil].
	(Object canUnderstand: #beWritableObject) ifFalse:
		[Object compile: 'beWritableObject "Stub, do nothing. Created by ', thisContext, '"' classified: '*SquotCompatibility' withStamp: nil notifying: nil].