# Operation recipes for managing the projects and execution environment.
#
# This file is part of Enasis Network software eco-system. Distribution
# is permitted, for more information consult the project license file.
#
# This file is present within multiple projects, simplifying dependency.



PYTHON ?= python

MAKE_COLOR ?= 6

MAKE_PRINT = @COLOR=$(MAKE_COLOR) \
	$(PYTHON) -Bc 'if 1: \
		from makefile import makeout; \
		makeout("$(1)", "$(2)");'

MAKE_PR1NT = $(call MAKE_PRINT,$(1),text)
MAKE_PR2NT = $(call MAKE_PRINT,$(1),base)
MAKE_PR3NT = $(call MAKE_PRINT,$(1),more)



.PHONY: help
help: .check-python
	@## Construct this helpful menu of recipes
	$(call MAKE_PRINT)
	@COLOR=$(MAKE_COLOR) \
		$(PYTHON) -B makefile.py
	$(call MAKE_PRINT)



.PHONY: jquery
jquery:
	@## Collect the latest jquery and install
	@#
	$(call MAKE_PR2NT,\
		<cD>make <cL>jquery<c0>)
	@#
	$(call MAKE_PR3NT,\
		<c37>Downloading <c90>jquery<c37> \
		from their website..<c0>)
	@wget --quiet \
		https://code.jquery.com/jquery-3.7.1.min.js \
		-O websites/scripts/jquery.js
	$(call MAKE_PR1NT,<cD>DONE<c0>)



.check-python:
ifndef PYTHON
	$(error PYTHON variable is not defined)
endif
