FROM denoland/deno:alpine-1.16.4
RUN apk add --no-cache graphviz
ADD fonts/ /usr/share/fonts/truetype/

WORKDIR /src
ADD deps.ts .
RUN deno cache deps.ts
ADD . .
RUN deno cache server.ts
ENTRYPOINT ["deno","run","--allow-env","--allow-net=0.0.0.0,api.github.com,cdn.deno.land,registry.npmjs.org","--allow-run=deno,dot","--allow-read=.","server.ts"]
