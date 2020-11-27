accessing
defaultMessage
	^ pickedVersion message,
		String cr, String cr,
		'(cherry-picked from commit ', pickedVersion internalId, ')'