internal
openLog
	"GitStore openLog"
	ToolBuilder open:
		(StringHolder new contents: ((LogMessages ifNil: [#()]) joinSeparatedBy: String cr, String cr))