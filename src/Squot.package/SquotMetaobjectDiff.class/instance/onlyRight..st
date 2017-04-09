initialize-release
onlyRight: aMetaobject
	changedInstVars := aMetaobject diffInstVarsAgainst: Dictionary new.
	changedVariablePart := aMetaobject diffVariablePartAgainst: #().