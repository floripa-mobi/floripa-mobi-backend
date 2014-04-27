# floripa.mobi-backend

Fetches public transit information and generates static JSON files to be used by the [floripa.mobi](http://floripa.mobi/) application.

Usage:

```bash
./fetch_lines.rb
```

The generated files are saved inside the `data` folder.

## Deployment

Deployment simply copy the generated files to the server.

```sh
./deploy.sh
```
