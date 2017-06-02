initialize-release
onlyRight: aMetaobject
	"Initialize me such that the left side is empty and the right side is aMetaobject"
	changedInstVars := aMetaobject diffInstVarsAgainst: Dictionary new.
	changedVariablePart := aMetaobject diffVariablePartAgainst: #().