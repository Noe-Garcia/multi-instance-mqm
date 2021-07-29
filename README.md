# multi-instance-mqm

1. Editar archivo config.mqsc con las colas deseadas
``` console 
vi config.mqsc 
```

2. Crear imagen

``` console
docker build -t mqm .
``` 
3. Crear carpeta, grupo y usuario mqm
 ``` console
 mkdir mqm
 sudo groupadd mqm
 sudo useradd mqm -g mqm
 sudo chown -Rf mqm:mqm ./mqm
 sudo chmod -Rf 775 mqm
``` 
4. Levantar el docker-compose de la primera instancia
``` console
docker-compose -f docker-compose-active.yml up -d
``` 
5. Levantar el docker-compose de la segunda instancia
``` console
docker-compose -f docker-compose-stanby.yml up -d
``` 
6. Comprobar contenedores corriendo
``` console
docker ps
``` 
7. Mostrar el estado `status` de ambos contenedores
``` console
docker exec -it [id contenedor active] dspmq -o all
docker exec -it [id contenedor standby] dspmq -o all
``` 
8. Detener e inicial colas. 
Nota: Es necesario pasar los comandos -x y -s para que al detener una cola, corra la otra y viseversa
``` console
docker exec -it [id contenedor] strmqm -x PMXSPEI01
docker exec -it [id contenedor] endmqm -s PMXSPEI01
``` 
