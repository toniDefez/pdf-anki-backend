 📘 pdf-anki-backend

**pdf-anki-backend** es una API escrita en **Python** diseñada como wrapper para generar tarjetas **Anki** automáticamente a partir de fragmentos de texto.  
La API recibe una petición con información de contexto y una frase, y devuelve una tarjeta completa con traducción, verbo principal, usos y ejemplos.

---

## 🚀 Descripción

El propósito principal de **pdf-anki-backend** es ayudar a estudiantes de idiomas (por ejemplo, inglés ↔ español) a crear tarjetas Anki enriquecidas con información contextual, sin tener que hacerlo manualmente.

La API toma como entrada una estructura JSON como la siguiente:

```json
{
  "q": "I wrote this book because",
  "context": "I wrote this book because on my long and winding deep learning journey I learned some things that I believe can be useful to others. Many of the insights that I share can accelerate your progress several-fold.",
  "source": "auto",
  "target": "es",
  "format": "text",
  "alternatives": 3
}
Y devuelve una tarjeta Anki con formato enriquecido:

json
Copiar código
{
  "front": "I wrote this book because",
  "back": {
    "traduccion": "Escribí este libro porque",
    "verbo_principal": "write",
    "usos": [
      "Usado para hablar de la acción de escribir algo, especialmente un libro, carta o texto.",
      "Expresa creación o autoría."
    ],
    "ejemplos": [
      {
        "en": "I wrote a letter to my parents.",
        "es": "Escribí una carta a mis padres."
      },
      {
        "en": "She wrote about her experiences in a blog.",
        "es": "Ella escribió sobre sus experiencias en un blog."
      }
    ],
    "contexto": "En este contexto, el autor explica la razón por la que escribió su libro."
  }
}