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

## 🐳 Docker Compose

You can build and run the application using Docker Compose. This will create and run three services: the Streamlit application, the Ollama service, and a one-time service to download the required AI models into a persistent volume.

### Running with Docker Compose

1.  **Build and Run the Services:**

    From the root of the project, run the following command. The first time you run this, it will download the base images and the AI models, which may take some time.

    ```sh
    docker-compose up --build
    ```
    The `--build` flag ensures that your application image is rebuilt if you make any changes to the code.

2.  **Access the Application:**

    Once all the services are running, you can access the Streamlit application in your web browser at:
    [http://localhost:8501](http://localhost:8501)

### Stopping the Application

To stop the services, you can press `Ctrl+C` in the terminal where `docker-compose` is running.

To stop the services and remove the containers, run:
```sh
docker-compose down
```

If you also want to remove the volume where the AI models are stored (which will cause them to be re-downloaded the next time you run `docker-compose up`), use the `-v` flag:
```sh
docker-compose down -v
```
