# QuantumLab - Anleitung

## Setup erfolgreich abgeschlossen!

Dein virtuelles Environment ist eingerichtet und Jupyter Lab läuft.

## Notebook-Kompatibilität

Das Notebook `QuantumLab50Jahre.ipynb` wurde für eine ältere Qiskit-Version erstellt.
Für Qiskit 1.x (aktuell installiert) sind folgende Änderungen nötig:

### Erforderliche Änderungen im Notebook

#### 1. Import-Zelle (Zelle 2) ändern von:
```python
import numpy as np
from qiskit import *
from qiskit.quantum_info import Operator, Statevector
from qiskit.tools.visualization import plot_histogram  # ← VERALTET
from qiskit.visualization import plot_bloch_multivector
```

#### zu:
```python
import numpy as np
from qiskit import QuantumCircuit, QuantumRegister, transpile
from qiskit.quantum_info import Operator, Statevector
from qiskit.visualization import plot_histogram, plot_bloch_multivector
from qiskit_aer import Aer
from qiskit_compat import execute  # Kompatibilitätswrapper
```

#### 2. Alle `cnot` Gates ersetzen mit `cx`:
Suche im Notebook nach: `QuantenCircuit.cnot(0,1)`
Ersetze mit: `QuantenCircuit.cx(0,1)`

## Schnelltest

Um zu prüfen, ob deine Installation funktioniert, führe aus:

```bash
venv/bin/python test_notebook.py
```

Dieser Test zeigt, ob alle Dependencies korrekt installiert sind.

## Jupyter Lab verwenden

Jupyter Lab läuft bereits auf: http://127.0.0.1:8888/lab?token=faa8c0bbb139513075abd8fd46c55281a2f9d20bb880ca6c

### Nützliche Befehle:

**Jupyter Lab starten:**
```bash
venv/bin/jupyter lab --ip=0.0.0.0 --no-browser
```

**Jupyter beenden:**
Drücke `Ctrl+C` zweimal im Terminal

## Alternative: Notebook manuell ausführen

Wenn du das Notebook von der Kommandozeile ausführen möchtest:

```bash
venv/bin/jupyter nbconvert --to notebook --execute QuantumLab50Jahre.ipynb --output output.ipynb
```

## Benötigte Dateien

- `qiskit_compat.py` - Kompatibilitätswrapper für die alte `execute()` Funktion
- `test_notebook.py` - Testscript zur Überprüfung der Installation

## Support

Das Notebook verwendet folgende Qiskit-Versionen:
- qiskit: 2.2.3
- qiskit-aer: 0.17.2
- numpy: 2.3.5
- matplotlib: 3.10.8

Wenn du Probleme hast, prüfe zuerst mit `test_notebook.py`, ob die grundlegende Installation funktioniert.
