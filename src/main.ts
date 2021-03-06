import { serve } from "./deps.ts";

const { PORT = 8000 } = Deno.env()
const s = serve(`0.0.0.0:${PORT}`);
const body = new TextEncoder().encode("Hola, Wikipedia!\n");

console.log(`Server started on port ${PORT}`);

for await (const req of s) {
  req.respond({ body });
}
