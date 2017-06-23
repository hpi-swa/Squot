tests
testHashWithGpgSignature
	| commit commitData |
	commitData := ('tree a6ecb56990109223da9d114ef7c678e0b94ac6f9
parent ad2bab3e276297a66fef15aa73cb5bf8216f1396
author Sebastian Bischoff <sebastian.bischoff@student.hpi.de> 1495318660 +0200
committer Sebastian Bischoff <sebastian.bischoff@student.hpi.de> 1495318660 +0200
gpgsig -----BEGIN PGP SIGNATURE-----
 
 iQIcBAABCgAGBQJZIMCFAAoJEDWrQXiVPx1rog4P/2OCk3m36sLzp+ijI0nBbHCG
 +9shUg757mHZokAI00/qzLPl46zhiTwD5CvQDpeBkav7Nx66OcxkgVkOlM7j0R4V
 zVwTG9aSc/B7S52tiVgvVjYNun0IkIbImBhFoocaHgnxV57NpMUOS1yQHMPch/tE
 ojpyq/tO9rn1DxlMhONMmA/DEXeh+x/xBnNh6HvGx/9knaL+kZTQn6L5xSexGCpU
 rQDB//epHZ17dNItOoc23zIr8YipgEZ/HSi5fXXQsxJFdRWft247SdRoplUDlbSY
 v8qJVdMG0208RPcu1EJ8xSzOEaiOuYwz1lxOtTWAT2nGQDOB8heCs+5cGjKPqWCH
 1kK+PGpTY7c9RGtVKY91+i/kGcadrDAal6A9dQxHKAOO29oTFkaoh38Pm8fqE+LR
 P2/lQB26gYhI10cbIvt+vZUZmYECDFyiQ9BdUjwoXuDBf1RCvUMsC8uzcsUHUe7h
 kkHMS6AD6zHbfqxmhnCPAi47d/Ocgz4DisxLsquCl4isHjPcBvG7DUySw8wZeHGd
 lA8EMGonoys21H+WHX9MI15QBxU5i+u9cECVbTVpIxPUhL3hAb8HcDTIAZPIxfZf
 R4i11ogl506Lb7z1wVShZ3QBh6CEdiAuuSN3+yrluK54X1kc/eJtWC+CBcTa9mQC
 7bxerAhVyOgClRGIEMsP
 =iXhI
 -----END PGP SIGNATURE-----

signed?
' withLineEndings: String lf) asByteArray.
	commit := GitCommit in: repository.
	commit loadFrom: commitData readStream.
	self assert: commitData equals: commit byteData.
	self assert: 'e2660bab07c19561e64ce86992e17927b61d9c2b' equals: commit hexHash