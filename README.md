# 📑 RAG with Cross-Encoders Re-ranking Demo Application

Demo LLM app with RAG for the YouTube video.

🚨 NOTE: **Requires `Python > 3.10` with  `SQLite > 3.35`**

Watch the video 👇

<a href="https://youtu.be/1y2TohQdNbo">
<img src="https://i.imgur.com/lJUyEm1.png" width="800">
</a>

---

### Part II: Watch Optimizing RAG with Semantic Cache ⚡️

<a href="https://youtu.be/0agBo7_wKTo">
<img src="https://i.imgur.com/rJJaHmG.png" width="400">
</a>

🐙 [**Codebase**](https://github.com/yankeexe/llm-rag-with-reranker-demo/tree/semantic-cache)


## 🤖 Prerequisites

- [Ollama](https://ollama.dev/download)

## 🔨 Setting up locally

Create virtualenv and install dependencies.

```sh
make setup
```

## ⚡️ Running the application

```sh
make run
```

## ✨ Linters and Formatters

Check for linting rule violations:

```sh
make check
```

Auto-fix linting violations:

```sh
make fix
```

## 🤸‍♀️ Getting Help

```sh
make

# OR

make help
```

## 🔧 Common Issues and Fixes

- If you run into any errors with incompatible version of ChromaDB/Sqlite3, refer to [this solution](https://docs.trychroma.com/troubleshooting#sqlite).

## 🐳 Docker

You can also build and run the application using Docker.

### Build the Docker Image

```sh
docker build -t llm-rag-demo .
```

### Run the Docker Container

To run the container in attached mode (useful for debugging):
```sh
docker run -p 8501:8501 -p 11434:11434 --name rag-app llm-rag-demo
```

To run the container in detached mode (in the background):
```sh
docker run -d -p 8501:8501 -p 11434:11434 --name rag-app llm-rag-demo
```

Once the container is running, you can access the Streamlit application at `http://localhost:8501`.
