MultiByteFileStream accessing
lineEndConvention: aSymbol
	self converter installLineEndConvention: (aSymbol caseOf: {
			[#cr] -> [String cr].
			[#lf] -> [String lf].
			[#crlf] -> [String crlf].
			[nil] -> [nil]}).