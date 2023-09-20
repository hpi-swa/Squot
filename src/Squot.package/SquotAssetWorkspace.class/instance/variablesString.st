bindings
variablesString
	| names pluralized |
	names := self getBindings keys.
	pluralized := names size caseOf: {
		[0] -> [^ ''].
		[1] -> ['variable {1}, which contains the {1} version']
	} otherwise: ['variables {1}, which contain the respective versions'].
	^ ' and may use the ', pluralized  format: {names asCommaStringAnd}