private
fetchRefs
	^ self
		fetchRefsFrom:
			(self clientForUploadPackService
				streaming: true;
				get)