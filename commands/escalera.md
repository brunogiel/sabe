---
description: Muestra tu progreso en la escalera del Personal Agentic OS y propone el próximo paso concreto.
---

Leé el archivo `ESCALERA.md` de la carpeta actual y hacé esto:

1. **Resumen de progreso** — mostrá nivel actual, barra (`░` pendiente / `█` completo) y conteo de ítems. Ejemplo:
   ```
   Nivel actual: 1  ·  Progreso: ██░░░░░  (2 / 7)
   ```

2. **Lo que ya lograste** — listá los ítems tachados (`[x]`) del nivel actual. Celebralo en una línea, sin exagerar.

3. **El próximo paso concreto** — el primer ítem `[ ]` del nivel actual. Explicalo en dos líneas: qué es y por qué sirve. Terminá con "¿Lo hacemos ahora?" y ofrecé una versión de 2 minutos si dice que no.

4. **Si el usuario dice que ya hizo algo** — tachalo en `ESCALERA.md` (`[ ]` → `[x]`), actualizá la barra y el "Nivel actual" si corresponde, y mostrá el nuevo estado.

5. **Si no existe `ESCALERA.md`** — avisá que el Personal Agentic OS todavía no está armado y ofrecé correr `/agentic-os-setup`.

---

**Tono:** corto, motivador, sin sermones. Mostrá logros antes que pendientes.
**Reglas:** no toques nada más que `ESCALERA.md`. Una acción a la vez con OK.
