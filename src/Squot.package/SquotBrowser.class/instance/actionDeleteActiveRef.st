actions
actionDeleteActiveRef
	self actionDeleteRef: (self activeRefIfNilInformAnd: [^ self]).