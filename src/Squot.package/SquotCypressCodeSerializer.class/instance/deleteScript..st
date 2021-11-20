private
deleteScript: aMCScriptDefinition
	| file |
	file := currentDirectory / cypressWriter monticelloMetaDirName / (aMCScriptDefinition scriptSelector asString, '.st').
	file delete.