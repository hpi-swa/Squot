private
cleanUpTemporaryHistorians

	temporaryHistorians
		do: [:historian | squotRepository delete: historian];
		removeAll.