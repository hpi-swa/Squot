internal
openLog
	ToolBuilder open:
		(StringHolder new contents: ((LogMessages ifNil: [#()]) joinSeparatedBy: String cr))