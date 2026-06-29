---
description: Verifica un output contra lo que pediste y fact-checkea sus datos (números, fechas, citas, claims). El gate antes de mandar.
---

Verificá el output que te pasen ($ARGUMENTS) contra lo que se pidió y fact-checkeá sus datos. Seguí esto:

# verificar — el gate del entregable

## Qué es
La IA es brillante en lo medible y mentirosa confiada en lo contextual: te tira un número, una cita o un "ya lo deployé" con total seguridad aunque esté mal. La única palanca real no es pedirle "hacelo mejor", es **verificar**. Esto agarra un output y, antes de darlo por bueno, chequea dos cosas: que cumpla lo que pediste, y que sus datos sean reales (contra la fuente, no contra la memoria del modelo). Un feedback loop así sube fuerte la calidad del resultado.

Verifica, no reescribe. El arreglo lo hacés después, con el veredicto en mano.

## Cuándo SÍ / Cuándo NO
- **SÍ:** un entregable multi-paso o con datos duros (números, montos, fechas, citas, referencias, claims de estado) que no querés mandar mal.
- **NO:** un texto interno corto sin datos duros que obviamente cumple el pedido (no hace falta); querés mejorar el SKILL, no el entregable → `evaluar-skill`; querés decidir entre opciones → `council`; querés varias lentes sobre algo → `panel`; sacar olor a IA de un texto → `anti-slop`.

## Las 3 movidas (de qué se trata verificar bien)
1. **Criterios arriba de todo.** Antes de juzgar, decí qué es "bueno" acá. Si el pedido no lo dejaba claro y eso cambia el veredicto, preguntá una sola cosa puntual.
2. **Segunda mirada con otra IA como crítico.** Si tu runtime deja lanzar subagentes, abrí uno con un **modelo distinto** al que produjo el output (otra "biblioteca", otros sesgos) para que lo critique en paralelo. Si no, hacé vos esa pasada crítica, leyendo el output como si lo hubiera hecho otro.
3. **Señal externa.** No le creas al output sobre el estado del mundo: chequealo. "Se deployó" → pegale al sistema. Reporte periódico → comparalo contra un histórico. Dato de un sistema propio → consultá la fuente.

## Qué lee y escribe
- **Lee:** el output a verificar (path a archivo, texto pegado, o "lo último de esta sesión") + las fuentes contra las que valida (la web, el doc fuente, el sistema, un histórico).
- **Escribe:** nada a archivos. Devuelve el veredicto en el chat. (No acumula estado: correrlo de nuevo sobre lo mismo da el mismo veredicto.)

## Flujo
1. **[LAT]** Calibrá profundidad. **Full** (con fact-check) si hay datos que no pueden estar mal o va a un tercero. **Liviano** (solo cumple-pedido + claims obvios) si es texto interno sin datos duros.
2. **[LAT]** Reconstruí en 1-2 líneas qué se pidió y qué es "bueno" acá. Si era vago en criterio o gusto y eso mueve el veredicto, preguntá una sola cosa.
3. **[LAT]** Chequeá que el output cumpla: cobertura (¿hizo todo?), formato (¿el shape pedido?), scope (¿se fue o se quedó corto?). Citá el output al marcar gaps.
4. **[LAT]** (full) Extraé todos los claims verificables: números, montos, %, fechas, nombres propios, citas textuales, referencias a docs o fuentes, afirmaciones de estado. Validá cada uno contra su fuente (subagentes en paralelo si el runtime los tiene; uno con modelo distinto como crítico). Cada claim vuelve ✅ validado / ⚠ no pude validar / ❌ falso, con la fuente.
5. **[LAT]** (full) Donde el output afirme un estado del mundo, chequealo de verdad (sistema, histórico, fuente), no le creas.
6. **[DET]** Si el output vino de un skill y querés además afinarlo a futuro, pasáselo a `evaluar-skill` (eso va a las propuestas del skill, no al veredicto de acá).
7. **[DET]** Veredicto global = el PEOR de los individuales. Un ❌ en un dato duro tira el global a ❌.

## Output esperado
```
## 🎯 Verificación

Veredicto: ✅ listo / ⚠ revisá esto / ❌ no mandes

Cumple el pedido: sí / parcial / no — <qué falta o se fue de scope>

Datos chequeados (full):
| Dato | Veredicto | Fuente |
|---|---|---|
| ... | ✅/⚠/❌ | ... |

Segunda mirada: <1-2 líneas de lo que marcó el crítico>
No pude validar: <lista honesta, o "nada">
Si querés, lo arreglo: <acciones concretas, solo si hay ❌/⚠>
```

## Reglas duras
1. Verifica, NO reescribe. El fix es otro turno.
2. Honestidad sobre el ⚠: lo que no se pudo validar es ⚠, nunca ✅ "por las dudas". El valor del skill es no mentir.
3. Citas textuales del output y de la fuente. Nada de "parece correcto".
4. El veredicto global es el peor individual: no promedia ni redondea para arriba.
5. No acumula: cada corrida es independiente.

## Señales de que lo hiciste bien
- Cada dato verificable tiene veredicto ✅/⚠/❌ con su fuente citada.
- Lo que no se pudo validar quedó como ⚠ explícito, no inflado a ✅.
- Hubo una segunda mirada crítica (otro modelo si se pudo, si no una pasada propia).
- El veredicto global es el peor de los individuales.
- Cero em-dashes en el texto en español.
