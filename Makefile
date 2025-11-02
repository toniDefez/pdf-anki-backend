.PHONY: dev deps add remove docs stop

ADD_PKG := $(wordlist 2,999,$(MAKECMDGOALS))
DEV_CMD := uv run uvicorn main:app --reload
PID_FILE := .make-dev.pid
LOG_FILE := .make-dev.log

deps:
	uv sync

dev:
	$(DEV_CMD)

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

docs:
	@url=http://127.0.0.1:8000/docs ; \
	if [ -f $(PID_FILE) ]; then \
		pid=$$(cat $(PID_FILE)); \
		if ps -p $$pid >/dev/null 2>&1; then \
			echo "Servidor FastAPI ya en ejecución (PID $$pid)."; \
		else \
			rm -f $(PID_FILE); \
		fi ; \
	fi ; \
	if [ ! -f $(PID_FILE) ]; then \
		echo "Iniciando servidor en segundo plano..."; \
		($(DEV_CMD) > $(LOG_FILE) 2>&1 & echo $$! > $(PID_FILE)); \
		sleep 2; \
	fi ; \
	if command -v xdg-open >/dev/null 2>&1; then \
		xdg-open $$url >/dev/null 2>&1 || echo "Abre $$url en tu navegador."; \
	elif command -v open >/dev/null 2>&1; then \
		open $$url >/dev/null 2>&1 || echo "Abre $$url en tu navegador."; \
	else \
		echo "Abre $$url en tu navegador."; \
	fi

stop:
	@if [ -f $(PID_FILE) ]; then \
		pid=$$(cat $(PID_FILE)); \
		if ps -p $$pid >/dev/null 2>&1; then \
			echo "Deteniendo FastAPI (PID $$pid)..."; \
			kill $$pid && rm -f $(PID_FILE); \
		else \
			echo "Proceso no encontrado, limpiando archivo de PID."; \
			rm -f $(PID_FILE); \
		fi; \
	else \
		echo "No hay servidor en ejecución."; \
	fi

%:
	@:
