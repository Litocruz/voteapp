# VoteApp

<p align="center">
  <img src="URL_DE_LA_IMAGEN_DEL_PROYECTO" alt="Logo o Diagrama de la aplicación de votos" />
</p>

## Descripción del Proyecto

VoteApp es una aplicación de votación moderna y escalable. Permite a los usuarios votar por una opción, y muestra los resultados en tiempo real. La arquitectura del proyecto está diseñada para ser modular, utilizando microservicios y contenedores, lo que facilita su despliegue y mantenimiento en entornos de desarrollo y producción.

---

## Características Principales

* **Aplicación de votación:** Una interfaz de usuario simple para que los usuarios puedan emitir su voto.
* **Resultados en tiempo real:** Una aplicación separada para mostrar los resultados de la votación de forma dinámica.
* **Worker:** Un servicio en segundo plano que procesa los votos de manera eficiente y asíncrona.
* **Persistencia de datos:** Uso de bases de datos para asegurar que los votos y los resultados se mantengan.
* **CI/CD Automatizado:** Un pipeline de GitHub Actions para verificar el código y desplegar la aplicación de forma continua.

---

## Arquitectura y Tecnologías

El proyecto se compone de tres microservicios principales, orquestados con Docker Compose.

* **`vote`**: La aplicación de frontend y backend para la votación.
    * **Tecnología:** Python con el microframework **Flask**.
    * **Funcionalidad:** Maneja la lógica de la votación y el frontend.
* **`result`**: La aplicación que muestra los resultados.
    * **Tecnología:** **Node.js**.
    * **Funcionalidad:** Recibe los datos de la base de datos y los presenta a los usuarios.
* **`worker`**: El servicio de procesamiento de datos.
    * **Tecnología:** **Node.js**.
    * **Funcionalidad:** Escucha los nuevos votos y los procesa.

### **Infraestructura:**

* **Orquestación:** **Docker Compose** para la gestión de contenedores en desarrollo.
* **Bases de Datos:**
    * **PostgreSQL:** Base de datos principal para almacenar los votos.
    * **Redis:** Utilizado como caché o para la comunicación entre servicios.
* **CI/CD:** **GitHub Actions** para la automatización de tests y despliegues.

---

## Primeros Pasos

Sigue estas instrucciones para poner a funcionar el proyecto en tu máquina local.

### **Prerrequisitos**

* [Docker](https://docs.docker.com/get-docker/) y [Docker Compose](https://docs.docker.com/compose/install/) instalados.

### **Instalación y Ejecución**

1.  **Clonar el repositorio:**
    ```bash
    git clone [https://github.com/Litocruz/voteapp.git](https://github.com/Litocruz/voteapp.git)
    cd voteapp
    ```

2.  **Configurar variables de entorno:**
    Copia el archivo de ejemplo para las variables de entorno:
    ```bash
    cp .env.example .env
    # Edita el archivo .env si necesitas cambiar las credenciales de la base de datos
    ```

3.  **Construir y arrancar los contenedores:**
    ```bash
    docker compose up --build -d
    ```
    Este comando construirá las imágenes de Docker de los tres servicios y los iniciará en segundo plano.

4.  **Acceder a la aplicación:**
    * **Votación:** [http://localhost:8080](http://localhost:8080)
    * **Resultados:** [http://localhost:3001](http://localhost:3001)

---

## Flujo de CI/CD

El proyecto cuenta con un pipeline de GitHub Actions que se ejecuta de la siguiente manera:

* **`ci.yml`**: Se ejecuta en cada `push` a la rama `develop` y en cada `pull_request` para validar el código con tests unitarios.
* **`deploy-staging.yml`**: Se activa al hacer `push` a `develop` si el CI es exitoso, y despliega la aplicación al entorno de staging.
* **`deploy-production.yml`**: Requiere una aprobación manual para desplegar la versión final a producción.

---

## Contribuciones

Si deseas contribuir a este proyecto, por favor, sigue el flujo de trabajo estándar de GitHub:
1.  Haz un "fork" del repositorio.
2.  Crea una nueva rama (`git checkout -b feature/nueva-funcionalidad`).
3.  Realiza tus cambios y haz `commit` (`git commit -m "feat: descripción de la nueva funcionalidad"`).
4.  Sube la rama (`git push origin feature/nueva-funcionalidad`).
5.  Abre un "Pull Request".

---

## Autor

**Litocruz**
* https://www.linkedin.com/in/julianlamadridlitocruz/
* https://github.com/Litocruz

---

## Licencia

Este proyecto está bajo la Licencia MIT.
