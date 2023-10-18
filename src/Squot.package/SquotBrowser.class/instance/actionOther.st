actions
actionOther
	| builder menu |
	builder := ToolBuilder default.
	menu := builder pluggableMenuSpec new.
	self otherMenu: menu.
	builder open: menu.