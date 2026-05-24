# Operation recipes for managing the projects and execution environment.
#
# This file is part of Enasis Network software eco-system. Distribution
# is permitted, for more information consult the project license file.
#
# This file is present within multiple projects, simplifying dependency.



PYTHON ?= python



MAKE_COLOR = 6

MAKE_PRINT = \
	@$(PYTHON) -Bc 'if 1: \
		from enbasics import makeout; \
		makeout( \
			color=$(MAKE_COLOR), \
			string="$(1)", \
			prefix="$(2)");'

MAKE_PR1NT = $(call MAKE_PRINT,$(1),text)
MAKE_PR2NT = $(call MAKE_PRINT,$(1),base)
MAKE_PR3NT = $(call MAKE_PRINT,$(1),more)



.PHONY: help
help: .check-python
	@## Construct this helpful menu of recipes
	$(call MAKE_PRINT)
	@$(PYTHON) -Bc 'if 1: \
		from enbasics import makefile; \
		makefile( \
			color=$(MAKE_COLOR), \
			path="Makefile", \
			name="websites", \
			version="0.3.7");'
	$(call MAKE_PRINT)



.check-python:
ifndef PYTHON
	$(error PYTHON variable is not defined)
endif
