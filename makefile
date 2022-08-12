.PHONY: test-guile test-gauche test-kawa test-chibi test-chicken

test-guile:
	guile -L / --r7rs srfi-235-test.scm

test-gauche:
	gosh -I . srfi-235-test.scm

test-kawa:
	cp srfi/235.sld srfi-235.scm
	kawa srfi-235-test.scm
	rm srfi-235.scm

test-chibi:
	chibi-scheme srfi-235-test.scm

test-chicken:
	csc -R r7rs -X r7rs -sJ -o srfi.235.so srfi/235.sld
	csi -I . -R r7rs -s srfi-235-test.scm
	rm srfi.235.so
	rm srfi.235.import.scm
