# ComputerCraft_Programs
Este es un **pack de 5 programas** escritos en Lua para el mod de **Minecraft CC: Tweaked.**

Los programas** cavar4.lua**,** escuchar.lua**,** lava2.lua** y **suelificar.lua** son para tortugas avanzadas (advenced turtles) equipadas con modem ( mejor avanzado de ender) y pico de diamante.

El programa** gestion.lua** es para el ordenador de bolsillo avanzado de Ender (advanced ender pocket computer).

Al usar estos programas, se podrá controlar las tortugas a distancia. Para ello es necesario que cada dispositivo tenga un puerto reservado. El puerto (or Channel) de cada dispositivo será igual a la suma de su **ID** y el valor de la variable **puertoInicial** (**Puerto = puertoInicial + os.getComputerID() **).

Puedes cambiar el valor de la variable **puertoInicial** editando los archivos **.lua** . Esto es útil en servidores, para poder repartir rangos de puerto entre los integrantes. Ten en cuenta que el valor del puerto tiene que estar en el **rango [0 , 65535]** . Es muy importante que los programas tengan el mismo valor en puertoInicial, si no, no funcionara la conexión.

 Para saber la id de cada dispositivo simplemente pon en su consola “id”.

# A partir que aquí, explicare cada programa por separado:

## gestion.lua
Este programa tiene interfaz gráfica y es muy útil, ya que permite ver el estado de las tortugas enlazadas (fuel, programa activo y estado) y nos permite finalizar y ejecutar los programas** Lava2.lua**, **cavar4.lua** y **suelificar2.lua** ¡Todo esto a distancia! 

Para configurarlo es muy sencillo, simplemente abre el programa con el editor y, en la variable **enlaces**, escriba las ID de las tortugas a las que te quieres conectar.  Ej: {23,34,54,12}

Para que la conexión se pueda efectuar es necesario que en las tortugas este activo el programa **escuchar.lua**, ya que es el encargado de recibir la conexión. 

Cuando todo este preparado, al iniciar el programa, podrás observar las tortugas activas en una lista y su distancia de ti.
    


## escuchar.lua
Este programa nos permite conectarnos a las tortugas, ya que es el encargado de recibir la conexión y ejecutar los programas. 

## cavar4.lua
Este programa nos permite cavar grandes extensiones de terreno usando las tortugas de manera automática.   Puedes iniciarlo directamente desde la consola o por conexión utilizando gestio.lua .  

Cuando lo ejecutemos, nos preguntara 3 cosas:
-	**Largura** -> aquí introduciremos cuantos bloques de largo quieres que cave, incluyendo en el que está.
-	**Anchura** -> aquí introduciremos cuantos bloques de ancho quieres que cave, incluyendo en el que está. Si el valor es positivo, lo hará hacia la derecha, si el valor es negativo, lo hará a la izquierda.
-	**Altura** -> aquí introduciremos cuantos bloques de altura quieres que cave. Si el valor es positivo, lo hará hacia arriba, si el valor es negativo, lo hará a hacia abajo.
En las dos primeras casillas del inventario de la tortuga se puede poner combustible, así, cuando necesite, ella se rellena sola. Aunque es recomendable rellenarla antes de ejecutar el programa, ya que el auto relleno, cuando detecta que el fuel es menor a 100, intentara rellenarse todo el tiempo, provocando que valla más lento.
Si la tortuga se queda sin fuel, y no le queda combustible en el inventario, automáticamente finalizara el programa.

También nombrar que todos los materiales que mine, los guardara en el inventario. Cuando su inventario este lleno, volverá a la posición inicial e intentará guarda los materiales en un cofre justo detrás de él. Si no ponemos un cofre, los ítems los tirara en ese sitio.

##suelificar2.lua
Este programa nos permite usar tortugas para poner suelos de manera automática. Puedes iniciarlo directamente desde la consola o por conexión utilizando gestio.lua.

  Cuando lo ejecutemos, nos preguntara 2 cosas:
-	**Largura** -> aquí introduciremos cuantos bloques de largo quieres poner, incluyendo en el que está.
-	**Anchura** -> aquí introduciremos cuantos bloques de ancho quieres que ponga, incluyendo en el que está. Si el valor es positivo, lo hará hacia la derecha, si el valor es negativo, lo hará a la izquierda.

El inventario de la tortuga lo tenéis que llenar del bloque que queréis utilizar. Si se queda sin bloques, volverá a la posición inicial y buscar en un cofre situado justo detrás de él. Si no encuentra nada, simplemente esperara a que lo rellenes.  Las dos primeras casillas están reservadas para combustible y los bloques que haya en esta, no los pondrá. Es preferible que ya este cargada, pues, como ocurre con cavar4.lua, irá mas lento si el fuel es menor a 100.

## lava2.lua
Este programa nos permite extraer lava el nether de manera automática. Útil para tener, prácticamente, combustible infinito. Puedes iniciarlo directamente desde la consola o por conexión utilizando gestio.lua.

Cuando lo ejecutemos, nos preguntara 3 cosas:
-	**Largura** -> aquí introduciremos cuantos bloques de largo quieres que extraiga lava, incluyendo en el que está.
-	**Anchura** -> aquí introduciremos cuantos bloques de ancho quieres que extraiga lava, incluyendo en el que está. Si el valor es positivo, lo hará hacia la derecha, si el valor es negativo, lo hará a la izquierda.
-	**Altura** -> aquí introduciremos cuantos bloques de altura hacia abajo quieres que extraiga lava, introduciendo el valor en positivo.

Para que funcione correctamente, es necesario llenar el inventario de la tortuga de cubos vacíos.

Cuando el programa empiece, la tortuga iniciara el recorrido. Cuando todos sus cubos estén llenos, volverá a la posición inicial y depositara la lava justo atrás de ella. Debido a que Minecraft no nos permite almacenar fluidos, solo nos quedan 3 opciones: recogerla nosotros mismos, utilizar mods que permitan almacenar fluidos (ej: Refined Storage) o poner una tortuga que recoja automáticamente la lava y se rellene el fuel.
