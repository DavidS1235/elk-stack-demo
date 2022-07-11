# elk-stack-logging-example
Centralize logging in microservice architecture using ELK Stack

###### Descargar ELK Binary Distribution

###### 1.Elastic Search [Download](https://www.elastic.co/downloads/elasticsearch).
###### 2.Logstash [Download](https://www.elastic.co/downloads/kibana).
###### 3.Kibana [Download](https://artifacts.elastic.co/downloads/logstash/logstash-7.6.2.zip).


###### Configurando Kibana

- Acceder a la carpeta de Kibana y buscar dentro la carpeta config.

- Abrir kibama.yml con un editor de texto.

- Buscar dentro del archivo yml el la linnea que diga: "elasticsearch.host [...]" y descomentarla.

- Guardar y cerrar.


###### Configurando Logstash

- Acceder a la carpeta de Logstash y buscar dentro la carpeta config.

- Crear un archivo "logstash-simple.conf".

- Editarlo de la siguiente manera:

input { 
	file {
		path => "C:/Logs/elk-stack.log"
		start_position => "beginning"
	}
}
output {
  elasticsearch { hosts => ["localhost:9200"] }
  stdout { codec => rubydebug }
}

- Guardar y cerrar.


###### Levantando servicios ELK Stack

- Acceder a la carpeta bin de ElasticSearch y ejecutar en consola:

    "elasticsearch.bat"

- Acceder a la carpeta bin de Kibana y ejecutar en consola:

  "kibana.bat"

- Acceder a la carpeta bin de Logstash y ejecutar en consola:

  "logstash -f logstash-simple.conf"

###### Comprobando ejecución y comunicación de Springboot con ELK Stack

- Levantar la aplicación de Springboot creada.

- Ir a "localhost:9200/_cat/indices"

- Copiar el índice que empieza por "logstash ... ".

- Pegarlo en la ruta "localhost:9200/[pegar aqui el indice copiado]/_search

- Obtendremos los logs de la aplicación en texto plano.


###### Creando un patrón de índice con ELK Stack

- Ir a la ejecución web de Kibana ("localhost:5601") en un navegador.
- En la sección "Management" buscar la opción Stack Management.
- Dentro de la sección "Kibana" buscar la opción "Index Patterns"
- Crear un index patter colocando de nombre "logstash_*" y "I don´t want to use time filter"
- Ir a  la sección "Discover" y se podrán apreciar los hits de los logs.