# CareForMe
Repositorio correspondiente al proyecto de memoria de título de una plataforma web orientada a los cuidadores informales y profesionales de la salud.
Plataforma dirigida principalmente a cuidadores informales con el objetivo de brindar información relevante sobre temas de cuidado de personas mayores con demencia. También permite distintas funcionalidades extras para apoyar en la labor de los cuidados en el día a día.

## Requisitos previos
1. Python 3.10 o superior

## ¿Cómo ejecutar el código? 
1. Crear un entorno de trabajo: `python3 -m venv env` (ejemplo con zsh macOS)
2. Ingresar a este entorno de trabajo.
3. Ingresar al directorio del repositorio `web-cuidador-informal/webcuidador/`
4. Instalar los paquetes necesarios con: `pip install -r requirements.txt`
5. Ejecutar la aplicación: `python manage.py runserver`


## ¿Cómo ejecutar los test con robotframework?
Para poder ejecutar los test automatizados, es necesario que estén instaladas las dependencias de este framework y además la librería de "Selenium". Para esto es necesario leer la [documentación](https://robotframework.org/SeleniumLibrary/) al respecto.
Una vez que estén instaladas las dependencias, se dará el ejemplo de ejecución con `Visual Studio Code` a continuación:
1. Instalar la extensión de `Robot Code` y `Robot Framework Formatter`.
   <img width="500" alt="Captura de Pantalla 2023-09-01 a la(s) 13 11 32" src="https://github.com/acotal22/web-cuidador-informal/assets/89815275/2faa9e05-f914-4632-8b49-48ba74aa469e"><img width="500" alt="Captura de Pantalla 2023-09-01 a la(s) 13 13 57" src="https://github.com/acotal22/web-cuidador-informal/assets/89815275/91db47f1-cf9d-4eaf-9df6-a558a65f7c5f">
3. Acceder al directorio donde se encuentran los archivos `.robot` `web-cuidador-informal/robotTest`
4. Se mostrarán los archivos como en la siguiente imagen, donde se podrán ejecutar todos de una vez o por separado:
   <img width="1380" alt="Captura de Pantalla 2023-09-01 a la(s) 13 22 24" src="https://github.com/acotal22/web-cuidador-informal/assets/89815275/3b4d1a41-6ea4-42cf-9d3e-c258a5e588dc">
