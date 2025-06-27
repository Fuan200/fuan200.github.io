# Portfolio Juan Díaz

```bash
podman build -t node-astro .

podman run --name portfolio -p 4321:4321 localhost/node-astro:latest
```

```bash
git pull

podman-compose down 
podman-compose build

podman-compose up -d
```