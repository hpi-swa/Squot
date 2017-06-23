testing
testNoNamesForPrimitiveValues
	| shadow |
	shadow := capturer capture: (SquotObjectForDiffTests new var1: 1; var2: nil).
	self deny: (shadow slots at: 'var1') hasSquotShadowName.
	self deny: (shadow slots at: 'var2') hasSquotShadowName.