private
isSmartResponse: response
	^ 'application/x-git-*-advertisement' match: response contentType