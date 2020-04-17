accessing
saveOperation
	^ save ifNil:
		[save := self privateNewSave
			unitOfWork: self unitOfWork;
			message: (pickedVersion message,
				String cr, String cr,
				'(cherry-picked from commit ', pickedVersion internalId, ')');
			yourself]