displaying
open
	| builder dialog urlWidget |
	builder := ToolBuilder default.
	(dialog := builder build: self)
		center: ActiveHand targetPoint;
		openInWorld.
	urlWidget := builder widgetAt: 'remoteUrl'.
	Project current isMorphic ifTrue: [self currentHand newKeyboardFocus: urlWidget].