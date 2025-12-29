# puede visualizarse en ejecución en

<a href="https://php-8-yii-2.drvelasquezq.site" target="_blank">https://php-8-yii-2.drvelasquezq.site</a>
<br>
<a href="https://php-8-yii-2.drvelasquezq.site" target="_blank">https://php-8-yii-2.drvelasquezq.site/index.php?r=debug/default/index</a>

## Descripción

Este proyecto da los pasos para utilizar y crear imagen de docker que ejecuta una aplicación de Yii 2 (Template de Proyecto Básico) con PHP integrando Apache en Debian, según: https://www.yiiframework.com/doc/guide/2.0/es/start-installation#installing-via-composer

<ul>
<li>Apache: 2.4.62</li>
<li>Yii: 2.0.45</li>
<li>PHP: 8.2.29</li>
<li>Debian: Bookworm</li>
</ul>

## Docker hub

[https://hub.docker.com/r/drvelasquezq/php-8-yii-2](https://hub.docker.com/r/drvelasquezq/php-8-yii-2)

## caracteristicas

<ul>
<li>Permite depurar el código con VS Code con Xdebug 3.2.0 con Docker</li>
</ul>

# Uso

```bash
# clonar proyecto
git clone https://github.com/drvelasquezq/docker-php-8-yii-2.git
# ingresar al proyecto
cd docker-php-8-yii-2
# crear contenedor
docker compose up -d
# ingresar al contenedor
docker exec -ti container-php-8-yii-2 bash
# despues de un ingreso exitoso ejecutar en el contenedor
cd basic
# otorgar permisos de escritura a carpeta publica de assets
chown -R www-data:www-data web/assets/
# otorgar permisos de escritura a carpeta publica de runtime
chown -R www-data:www-data runtime/
# instalar dependencias en el contenedor
composer install
```
luego podrá ingresar a:
<br>
<a href="http://localhost:8089/basic/web/" target="_blank">http://localhost:8089/basic/web/</a>
<br>
<a href="http://localhost:8089/basic/web/index.php?r=debug/default/index" target="_blank">http://localhost:8089/basic/web/index.php?r=debug/default/index</a>
<br>
<a href="http://localhost:8089/basic/requirements.php" target="_blank">http://localhost:8089/basic/requirements.php</a>

### ejemplo para construir la imagen: 
```bash
docker build --no-cache --progress=plain --tag drvelasquezq/php-8-yii-2:1.0.0 . > output-build-image/output.log 2>&1
```

### ejemplo para crear contenedor que solo ejecute el script sh que ya está en la imagen
```bash
docker run --name container-php-8-yii-2 drvelasquezq/php-8-yii-2:1.0.0
```

### ejemplo para crear contenedor con la imagen y ejecutarlo de manera interactiva:
```bash
docker run --tty --interactive -p 8089:80 --name container-php-8-yii-2 drvelasquezq/php-8-yii-2:1.0.0 bash
```

### ejemplo para crear contenedor con la imagen y ejecutarlo en segundo plano
```bash
docker run -d -p 8089:80 --name container-php-8-yii-2 drvelasquezq/php-8-yii-2:1.0.0
```
```bash
# para luego ingresar al contenedor
docker exec -ti container-php-8-yii-2 bash
```

### ejemplo para remover contenedor:
```bash
docker rm -f container-php-8-yii-2
```

### ejemplo de copia de archivo:
```
docker cp container-php-8-yii-2:/etc/php/8.2/cli/php.ini ./etc/php/8.2/cli/
```

### ejemplo para subir imagen a docker hub
```bash
docker tag php-8-yii-2:1.0.0 drvelasquezq/php-8-yii-2:1.0.0
```
```
docker push drvelasquezq/php-8-yii-2:1.0.0
```