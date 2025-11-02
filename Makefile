.PHONY: dev deps add remove

ADD_PKG := $(wordlist 2,999,$(MAKECMDGOALS))

deps:
	uv sync

dev:
	uv run uvicorn main:app --reload

add:
	@if [ -z "$(ADD_PKG)" ] && [ -z "$(pkg)" ]; then \
		echo "Uso: make add paquete" ; \
		echo "     make add pkg=paquete" ; \
		exit 1 ; \
	fi
	uv add $(if $(ADD_PKG),$(ADD_PKG),$(pkg))

remove:
	@if [ -z "$(ADD_PKG)" ] && [ -z "$(pkg)" ]; then \
		echo "Uso: make remove paquete" ; \
		echo "     make remove pkg=paquete" ; \
		exit 1 ; \
	fi
	uv remove $(if $(ADD_PKG),$(ADD_PKG),$(pkg))

%:
	@:
