private
requestRemoteDetails
	query afterCloseContinueIn: self with: #onQueryClose:.
	Project current addDeferredUIMessage: [query open].