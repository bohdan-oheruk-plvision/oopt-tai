doc:
	doxygen Doxyfile

stub:
	$(MAKE) -C ./stub

test: stub
	$(MAKE) -C ./test
	LD_LIBRARY_PATH=./stub:./meta ./test/test

docker:
	@docker run -it --rm -v `pwd`:/oopt-tai -w /oopt-tai stratumproject/build:build

.PHONY: doc stub test
