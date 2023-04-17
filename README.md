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

![Captura de pantalla 2023-04-17 a la(s) 15 08 45](https://user-images.githubusercontent.com/1909869/232591906-122a3bfd-1f4f-4ede-b7c6-6f9a1e9e87c3.png)

Tambien se utiliza https://firebase.google.com/products/realtime-database donde se tiene la base de datos de los productos.

<img width="464" alt="Captura de pantalla 2023-04-17 a la(s) 15 33 09" src="https://user-images.githubusercontent.com/1909869/232591785-f2bf267f-b950-4800-984f-7b2cdaabcc07.png">

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
![Simulator Screenshot - iPhone 14 Pro Max - 2023-04-17 at 14 24 16](https://user-images.githubusercontent.com/1909869/232591963-2a28d5f9-eeaf-4564-9b02-fbb27cae5b9f.png)

![Simulator Screenshot - iPhone 14 Pro Max - 2023-04-17 at 14 24 23](https://user-images.githubusercontent.com/1909869/232591966-76199b51-5b80-4451-8626-a8e44b79176a.png)
  


### Home Productos:
   
![Simulator Screenshot - iPhone 14 Pro Max - 2023-04-17 at 14 22 33](https://user-images.githubusercontent.com/1909869/232592051-f90a99b1-6bbb-46ef-b52d-51d6f4646173.png)


### Producto Seleccionado:

![Simulator Screenshot - iPhone 14 Pro Max - 2023-04-17 at 15 35 36](https://user-images.githubusercontent.com/1909869/232592262-89e66285-15c9-45ba-86df-9e9ef3d26e98.png)


### Crear producto:

![Simulator Screenshot - iPhone 14 Pro Max - 2023-04-17 at 15 35 26](https://user-images.githubusercontent.com/1909869/232592310-332f8adf-a6ec-480e-9b1f-4ec0e28b75f0.png)


