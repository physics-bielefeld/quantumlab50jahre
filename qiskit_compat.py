"""
Qiskit Kompatibilitäts-Wrapper für alte execute() Funktion
"""

def execute(circuit, backend, **kwargs):
    """
    Wrapper für die alte execute() Funktion.
    In Qiskit 1.x wurde execute entfernt, daher verwenden wir transpile + run.
    """
    from qiskit import transpile as _transpile

    # Transpiliere den Circuit für das Backend
    transpiled = _transpile(circuit, backend)

    # Führe aus
    return backend.run(transpiled, **kwargs)
