class initialization
initializeSqueak53Compatibility
	"Squeak 5.3 and below do not have read-only objects."
	(Object canUnderstand: #beReadOnlyObject) ifFalse:
		[Object compile: 'beReadOnlyObject "Stub, do nothing. Created by ', thisContext, '"' classified: '*FileSystem-Git-Compatibility'].
	(Object canUnderstand: #beWritableObject) ifFalse:
		[Object compile: 'beWritableObject "Stub, do nothing. Created by ', thisContext, '"' classified: '*FileSystem-Git-Compatibility'].