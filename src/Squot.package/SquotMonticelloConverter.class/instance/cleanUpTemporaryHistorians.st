private
cleanUpTemporaryHistorians

	temporaryHistorians removeAllSuchThat: [:historian |
		squotRepository delete: historian.
		true].