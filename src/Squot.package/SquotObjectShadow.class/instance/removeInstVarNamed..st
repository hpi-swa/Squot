initialize-release
removeInstVarNamed: aString
	"Create a partial snapshot by not capturing this instance variable any longer."
	^ slots removeKey: aString