# Makefile für QuantumLab Projekt
# Verwendung: make <target>

.PHONY: help init clean jupyter run run-notebook

# Python und venv Pfade
PYTHON := python3
VENV := venv
VENV_BIN := $(VENV)/bin
PIP := $(VENV_BIN)/pip
JUPYTER := $(VENV_BIN)/jupyter

# Notebook Dateien
NOTEBOOK := QuantumLab50Jahre.ipynb
NOTEBOOK_TESTED := QuantumLab50Jahre_tested.ipynb

help:
	@echo "QuantumLab Makefile - Verfügbare Targets:"
	@echo ""
	@echo "  make init          - Setup: venv erstellen und Dependencies installieren"
	@echo "  make run           - Starte Jupyter Lab Server"
	@echo ""
	@echo "  make run-notebook  - Führe Notebook auf der Kommandozeile aus"
	@echo ""
	@echo "  make clean         - Lösche temporäre Dateien und Virtual Environment"

# Komplettes Setup: venv erstellen und Dependencies installieren
init:
	@echo "Erstelle virtuelles Environment..."
	$(PYTHON) -m venv $(VENV)
	@echo "Aktualisiere pip..."
	$(PIP) install --upgrade pip
	@echo "Installiere Dependencies aus binder/requirements.txt..."
	$(PIP) install -r binder/requirements.txt
	@echo "Registriere Jupyter Kernel..."
	$(VENV_BIN)/python -m ipykernel install --user --name=qiskit --display-name="Python (qiskit)"
	@echo "Setup abgeschlossen!"

# Jupyter Lab starten
run: jupyter

jupyter: $(VENV_BIN)/jupyter
	@echo "Starte Jupyter Lab..."
	@echo "Öffne im Browser: http://127.0.0.1:8888/"
	$(JUPYTER) lab --ip=0.0.0.0 --no-browser

# Notebook automatisch ausführen (ohne Browser)
run-notebook: $(VENV_BIN)/jupyter
	@echo "Führe Notebook aus: $(NOTEBOOK)"
	$(JUPYTER) nbconvert --to notebook --execute $(NOTEBOOK) \
		--output $(NOTEBOOK_TESTED) \
		--ExecutePreprocessor.timeout=600
	@echo "Notebook erfolgreich ausgeführt: $(NOTEBOOK_TESTED)"


# Temporäre Dateien und Virtual Environment löschen
clean:
	@echo "Lösche temporäre Dateien..."
	@rm -f $(NOTEBOOK_TESTED)
	@rm -f QuantumLab50Jahre_fixed*.ipynb
	@find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
	@find . -type f -name "*.pyc" -delete 2>/dev/null || true
	@echo "Temporäre Dateien gelöscht"
	@echo "Lösche Virtual Environment..."
	@rm -rf $(VENV)
	@echo "Virtual Environment gelöscht"

# Hilfstargets zum Prüfen ob venv existiert
$(VENV_BIN)/python:
	@echo "ERROR: Virtual Environment nicht gefunden!"
	@echo "Führe erst 'make init' aus."
	@exit 1

$(VENV_BIN)/jupyter: $(VENV_BIN)/python
	@if [ ! -f $(VENV_BIN)/jupyter ]; then \
		echo "ERROR: Jupyter nicht installiert!"; \
		echo "Führe erst 'make install' aus."; \
		exit 1; \
	fi
