initialize-release
diff: leftMetaobject against: rightMetaobject
	changedInstVars := leftMetaobject diffInstVarsAgainstThoseOf: rightMetaobject.
	changedVariablePart := leftMetaobject diffVariablePartAgainstThatOf: rightMetaobject.