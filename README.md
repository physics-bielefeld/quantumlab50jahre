# QuantumLab - Quantum Computing Workshop

Ein interaktiver Workshop zur Einführung in Quantum Computing mit IBM Qiskit.

## Überblick

Dieser Workshop führt in die Grundlagen des Quantum Computing ein:

1. **Quantenzustände & Messungen** - Superposition und Messung von Qubits
2. **Entanglement** - Verschränkte Quantenzustände
3. **Quanten-Algorithmen** - Grover-Algorithmus und Quantenparallelismus

## Ausführung auf BinderHub

Das Jupyter-Notebook kann auf dem BinderHub der Universität Münster direkt ausgeführt werden: \
https://binderhub.uni-muenster.de/v2/gh/physics-bielefeld/quantumlab50jahre.git/HEAD

[![Binder](https://binderhub.uni-muenster.de/badge_logo.svg)](https://binderhub.uni-muenster.de/v2/gh/physics-bielefeld/quantumlab50jahre/HEAD)

## Ausführung auf einem lokalem Rechner

### Voraussetzungen

- Python 3.8 oder höher
- `make` (optional, aber empfohlen)

### 1. Setup

```bash
make init
```

Dies erstellt ein virtuelles Environment und installiert alle benötigten Dependencies.

### 2. Jupyter Lab starten

```bash
make run
```

Öffne dann im Browser: http://127.0.0.1:8888/

### 3. Notebook öffnen

Öffne `QuantumLab.ipynb` im Jupyter Lab und arbeite interaktiv durch die Zellen.

## Verwendung ohne Make

Falls `make` nicht verfügbar ist:

```bash
# Setup
python3 -m venv venv
venv/bin/pip install --upgrade pip
venv/bin/pip install -r binder/requirements.txt
venv/bin/python -m ipykernel install --user --name=qiskit --display-name="Python (qiskit)"

# Jupyter starten
venv/bin/jupyter lab --ip=0.0.0.0 --no-browser
```

## Verfügbare Make-Targets

```bash
make help          # Zeigt alle verfügbaren Befehle
make init          # Komplettes Setup (venv + Dependencies)
make run           # Starte Jupyter Lab Server
make clean         # Lösche temporäre Dateien und Virtual Environment
```

## Dependencies

Das Projekt verwendet:

- **Qiskit 2.2.3+** - IBM Quantum Computing Framework
- **Qiskit Aer** - Quantum Circuit Simulator
- **NumPy** - Numerische Berechnungen
- **Matplotlib** - Visualisierungen
- **Jupyter Lab** - Interaktive Notebook-Umgebung

Siehe `binder/requirements.txt` für Details.


## Notebook ausführen

**Interaktiv im Browser:**
```bash
make run
```

## Troubleshooting

### Jupyter Kernel nicht gefunden

Falls der Kernel "qiskit" nicht gefunden wird:

```bash
venv/bin/python -m ipykernel install --user --name=qiskit --display-name="Python (qiskit)"
```

### Import-Fehler

Stelle sicher, dass alle Dependencies installiert sind:

```bash
make init
```

### Port 8888 bereits belegt

Jupyter auf anderem Port starten:

```bash
venv/bin/jupyter lab --port=8889 --no-browser
```

## BinderHub

### Konfiguration

Dieses Repository ist für Binder/BinderHub vorbereitet. Die Konfigurationsdateien befinden sich im `binder/` Verzeichnis:

- **binder/requirements.txt** - Python Dependencies für Binder
- **binder/runtime.txt** - Python Version (3.11)
- **binder/postBuild** - Post-Installation Setup (Jupyter Kernel Registration)

Diese Dateien ermöglichen die automatische Ausführung des Notebooks auf einem BinderHub.

### BinderHub Container generieren

Auf der Hauptseite https://binderhub.uni-muenster.de kann unter Angabe der URL auf das GitHub-Repo eine neue Version des Containers erzeugt werden. 

## Lizenz

Dieses Projekt dient Bildungszwecken.

## Kontakt

Bei Verbesserungsvorschlägen oder Fehlern auf dieser Seite bitte an: info@physik.uni-bielefeld.de wenden.
