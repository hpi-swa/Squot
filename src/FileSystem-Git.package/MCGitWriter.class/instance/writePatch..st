visiting
writePatch: aMCPatch 
	(aMCPatch simplifyHierarchy) operations do: [:operation|
		self writePatchOperation: operation].