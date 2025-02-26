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



.check-python:
ifndef PYTHON
	$(error PYTHON variable is not defined)
endif
