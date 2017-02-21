updating
syncMethodsOfClass: aClass in: aDirectory 
	self syncMethods: (aClass methodDict keys) withFiles: aDirectory / #instancemethod.
	self syncMethods: (aClass class methodDict) keys withFiles: aDirectory / #classmethod.
							