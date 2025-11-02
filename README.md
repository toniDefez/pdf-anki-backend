# 📘 pdf-anki-backend

**pdf-anki-backend** es una API escrita en **Python** que genera tarjetas **Anki** enriquecidas a partir de fragmentos de texto. Recibe una frase con su contexto y devuelve traducciones, verbo principal, usos y ejemplos listos para importar.

---

## 🚀 Descripción

El servicio ayuda a estudiantes de idiomas (por ejemplo, inglés ↔ español) a crear tarjetas Anki sin trabajo manual. Acepta una petición JSON como la siguiente:

```json
{
  "q": "I wrote this book because",
  "context": "I wrote this book because on my long and winding deep learning journey I learned some things that I believe can be useful to others. Many of the insights that I share can accelerate your progress several-fold.",
  "source": "auto",
  "target": "es",
  "format": "text",
  "alternatives": 3
}
```

Y responde con una tarjeta Anki con formato enriquecido:

```json
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
```

---

## ⚙️ Configuración del entorno

- Requiere Python 3.13 o superior. El proyecto usa [uv](https://docs.astral.sh/uv/) como gestor de dependencias y ejecución.
- Después de clonar el repositorio, instala las dependencias con `uv`:

  ```bash
  uv sync
  ```

  También puedes usar el Makefile incluido:

  ```bash
  make deps
  ```

---

## 🛠️ Desarrollo local

El Makefile expone estos atajos útiles:

- `make deps`: sincroniza dependencias con `uv sync`.
- `make add paquete` / `make remove paquete`: agrega o elimina dependencias utilizando `uv`.
- `make dev`: arranca el servidor con recarga automática (`uv run uvicorn main:app --reload`).
- `make docs`: inicia el servidor en segundo plano (si no está corriendo) y abre la documentación interactiva (`/docs`) en el navegador.
- `make stop`: detiene el servidor levantado con `make docs`.

Puedes ejecutar los comandos de `uv` equivalentes de forma directa si lo prefieres.

Los logs del servidor lanzado en segundo plano se guardan en `.make-dev.log`.

Una vez levantado, visita `http://127.0.0.1:8000/` o explora la documentación interactiva en `http://127.0.0.1:8000/docs`.
