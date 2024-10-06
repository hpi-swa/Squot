toolbuilder
buildChildren
	| child |
	child := (self builder build: self buildChild)
		layoutFrame: LayoutFrame fullFrame;
		yourself.
	self flag: #todo. "workaround for layout bug"
	Project current addDeferredUIMessage: [child owner ifNotNil: #layoutChanged].
	^ {child}