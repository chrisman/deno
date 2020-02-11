FROM deno

EXPOSE 8000

WORKDIR /app

USER deno

COPY src/deps.ts .
RUN deno fetch deps.ts

ADD src .
RUN deno fetch main.ts

ENTRYPOINT ["deno", "run", "--allow-net", "main.ts"]
