
# Correr Nuke en local


## Necesitamos tener go instalado una version >=1.21.0

(Situandose en la raiz el proyecto)

Instalamos paquete necesarios.
 ```
  go install golang.org/x/lint/golint@latest
 ```

Descargamos el codigo fuente 

 ```
wget https://github.com/rebuy-de/aws-nuke/archive/v2.24.2.zip
unzip v2.24.2.zip
 ```

Entramos y realizamos el build


 ```
cd aws-nuke-2.24.2
go build
 ```

Volvemos a la carpeta raiz y ejecutamos el nuke (esto solo hará un resumen)

```
cd ..
./aws-nuke-2.24.2/aws-nuke -c nuke/nuke-config.yaml --force --access-key-id "$ADMIN_AWS_ACCESS_KEY" --secret-access-key  "$ADMIN_AWS_ACCESS_SECRET"
```

Para ejecutar dicho resumen hay que colocar el parametro --no-dry-run

## **Asegurese de revisar el resumen antes de colocar este parametro, NO HAY ROLLBACK**
----
## Tips :
 Todos los logs que tengan una "->" seguramente se filtraran con glob con incluyendo en el valor estos caracteres como si fuera una regexp " a ->  * "
 o " * -> b" etc ...

Tambien es posible que no deba indicar la propiedad a modificar si son cosas como identificadores, es decir tiratamente el tipo y el valor. (Ver IAMRole)

Documentacion Oficial:

https://github.com/rebuy-de/aws-nuke

