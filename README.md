# QuantumLab - Quantum Computing Workshop

Ein interaktiver Workshop zur Einführung in Quantum Computing mit IBM Qiskit.

## Überblick

Dieser Workshop führt in die Grundlagen des Quantum Computing ein:

1. **Quantenzustände & Messungen** - Superposition und Messung von Qubits
2. **Entanglement** - Verschränkte Quantenzustände
3. **Quanten-Algorithmen** - Grover-Algorithmus und Quantenparallelismus

## Voraussetzungen

- Python 3.8 oder höher
- `make` (optional, aber empfohlen)

## Schnellstart

### 1. Setup

```bash
make init
```

Dies erstellt ein virtuelles Environment und installiert alle benötigten Dependencies.

### 2. Jupyter Lab starten

```bash
make jupyter
```

Öffne dann im Browser: http://127.0.0.1:8888/

### 3. Notebook öffnen

Öffne `QuantumLab50Jahre.ipynb` im Jupyter Lab und arbeite interaktiv durch die Zellen.

## Verwendung ohne Make

Falls `make` nicht verfügbar ist:

```bash
# Setup
python3 -m venv venv
venv/bin/pip install --upgrade pip
venv/bin/pip install -r requirements.txt
venv/bin/python -m ipykernel install --user --name=qiskit --display-name="Python (qiskit)"

# Jupyter starten
venv/bin/jupyter lab --ip=0.0.0.0 --no-browser
```

## Verfügbare Make-Targets

```bash
make help          # Zeigt alle verfügbaren Befehle
make init          # Komplettes Setup
make jupyter       # Starte Jupyter Lab Server
make run-notebook  # Führe Notebook automatisch aus
make backup        # Erstelle Backup mit Zeitstempel
make clean         # Lösche temporäre Dateien und Virtual Environment
```

## Dependencies

Das Projekt verwendet:

- **Qiskit 2.2.3+** - IBM Quantum Computing Framework
- **Qiskit Aer** - Quantum Circuit Simulator
- **NumPy** - Numerische Berechnungen
- **Matplotlib** - Visualisierungen
- **Jupyter Lab** - Interaktive Notebook-Umgebung

Siehe `requirements.txt` für Details.


## Notebook ausführen

**Interaktiv im Browser:**
```bash
make jupyter
```

**Automatisch von der Kommandozeile:**
```bash
make run-notebook
```

Dies führt alle Zellen aus und speichert das Ergebnis in `QuantumLab50Jahre_tested.ipynb`.

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

## Entwicklung

### Installation testen

```bash
venv/bin/python test_notebook.py
```

### Requirements aktualisieren

```bash
make freeze  # Erstellt requirements_freeze.txt mit exakten Versionen
```

### Backup erstellen

```bash
make backup  # Erstellt Backup mit Zeitstempel in archive/
```

## Lizenz

Dieses Projekt dient Bildungszwecken.

## Kontakt

Workshop-Material für Quantum Computing Einführung.
