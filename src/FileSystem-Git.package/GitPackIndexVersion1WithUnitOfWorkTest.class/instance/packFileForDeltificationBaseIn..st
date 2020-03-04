helpers-verifying
packFileForDeltificationBaseIn: aRepository
	^ GitPackFile on: aRepository packsDir / 'pack.pack' in: aRepository newUnitOfWork