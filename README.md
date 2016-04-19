## Welcome to the front-end development workspace with stealjs tool

This inviroment is focused to build front-end applications based on CanJS library
Contains helpers: stealjs, jquery, bootstrap
NodeJS tools: npm, http-server, bower

### Container commands

| Command        | Description                                    |
| :------------- | :--------------------------------------------- |
| build          | Short to npm run build                         |
| run [scenario] | Run scenario from project package.json         |
| server         | Start http-server with DocumentRoot /opt/jmvc  |
| --help         | Cat this Readme to the console                 |

### Workspace and mount

- Workspace path is /opt/jmvc
- Libraries installed to /opt/jmvc/libs

You should mount project directory to the container workspace `/opt/jmvc` by passing volume parameter `-v project_path:/opt/jmvc/project_dir_name`

### Examples

Go to the project directory and start:

```
docker run -it --rm -v $(pwd):/opt/jmvc/$(basename $(pwd)) -p 88:80 stealjs server
```

Open browser and go to http://[docker_host_address]:88/


Script scenario from package.json

```
docker run -it --rm -v $(pwd):/opt/jmvc/$(basename $(pwd)) -w /opt/jmvc/$(basename $(pwd)) stealjs run build
```
