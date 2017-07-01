public
openLabel: titleString
	| builder view |
	builder := ToolBuilder default.
	view := builder open: self label: titleString.
	builder runModal: view.