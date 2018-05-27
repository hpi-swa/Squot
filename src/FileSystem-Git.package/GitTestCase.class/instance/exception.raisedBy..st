helpers
exception: anExceptionalEvent raisedBy: aBlock
	self should: aBlock raise: anExceptionalEvent.
	^ aBlock on: anExceptionalEvent do: [:e | e return: e]
	