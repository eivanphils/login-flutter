## Flutter Productos

Esta es una aplicación para profundizar en un CRUD de productos simples siguiendo este tutorial [https://docs.flutter.dev/development/ui/layout/tutorial](https://docs.flutter.dev/development/ui/layout/tutorial), ademas de continuar con el cursor de Fernando Herrera [https://www.udemy.com/course/flutter-ios-android-fernando-herrera/.](https://www.udemy.com/course/flutter-ios-android-fernando-herrera/.) El proposito final es aprender a desarrollar aplicaciones móviles con Flutter y poder desplegarlas en sus respectivas tiendas. 

---

## Levantar el proyecto

Puede levantar el proyecto con visual studio code ejecutando comand + shift + P. Luego "Select Device".

<img src="https://github.com/eivanphils/flutter-app-counter/blob/master/assets/select_device.png" width="500">     

Luego abre el archivo main.dart y presiona F5 o fn + F5 app. 


**Nota**: es importante tener instalado todas las configuraciones necesarias para flutter

[https://docs.flutter.dev/get-started/install](https://docs.flutter.dev/get-started/install)

## Descripción

La app posee 3 pantallas las cuales son:
- Login Page
- Home page
- Detail Product Page

## Herramientas externas

Se utiliza https://cloudinary.com para alojar las imagenes de la app.

Tambien se utiliza https://firebase.google.com/products/realtime-database donde se tiene la base de datos de los productos.

## Paquetes de terceros

En el proyecto se han utilizado algunos paquetes de terceros que fueron de mucha ayuda para la construcción final.

A continuación encontrará la información sobre estos paquetes.

| Paquete    | Explicación |
| ------------- |:-------------:|
| cupertino_icons  | Iconos de cupertino |
| providers  | Manejador de estados |
| card_swiper  | carrusel de widgets |
| http  | Peticiones http |
| image_picker  | Selector de imagenes de galeria y/o camara |

## Estructura de directorio

| Directorio    | Explicación |
| ------------- |:-------------:|
| assets  | Contiene todas las imagenes png, svg o gif |
| android, ios, web | Contiene todas las configuraciones de la plataforma que genera flutter automáticamente |
| lib     | Contiene toda la lógica de la aplicación |

Luego el directorio lib

| Directorio    | Explicación |
| ------------- |:-------------:|
| screens   | Contiene todas las clases de cada pantalla de la app |
| widgets   | Contiene todos los  widgets personalizados que se reutilizan en distintas secciones de la app |
| models     | Contiene todos los modelos |
| providers     | Contiene todos los providers |
| services     | Contiene todos los servicios en este caso para peticiones http |
| theme     | Contiene toda la configuración del tema |
| ui     | Contiene lógica de estilos de inputs |
| utils     | Contiene la lógica del validador del rut |


## Capturas de pantalla

### Login:

<img src="https://github.com/eivanphils/flutter-design/blob/master/assets/Simulator%20Screen%20Shot%20-%20iPhone%2013%20mini%20-%202022-08-01%20at%2011.58.04.png" width="200">     


### Home Productos:

<img src="https://github.com/eivanphils/flutter-design/blob/master/assets/Simulator%20Screen%20Shot%20-%20iPhone%2013%20mini%20-%202022-08-01%20at%2011.58.21.png" width="200">     

https://user-images.githubusercontent.com/1909869/182191028-4e498fb0-2283-48ec-872a-fbc5d9bcb00f.mp4


### Producto Seleccionado:

<img src="https://github.com/eivanphils/flutter-design/blob/master/assets/Simulator%20Screen%20Shot%20-%20iPhone%2013%20mini%20-%202022-08-01%20at%2011.58.49.png" width="200">     

https://user-images.githubusercontent.com/1909869/182191193-d1e49f1f-d9d8-47c6-85bd-d1ea5f41d7fd.mp4


### Crear producto:

<img src="https://github.com/eivanphils/flutter-design/blob/master/assets/Simulator%20Screen%20Shot%20-%20iPhone%2013%20mini%20-%202022-08-01%20at%2011.58.49.png" width="200">     

https://user-images.githubusercontent.com/1909869/182191193-d1e49f1f-d9d8-47c6-85bd-d1ea5f41d7fd.mp4

