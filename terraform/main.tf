provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_image" "postgres" {
  name = "postgres:15.8"
}

resource "docker_container" "db" {
  image = docker_image.postgres.latest
  name  = "db"
  
  env = [
    "POSTGRES_USER=postgres",
    "POSTGRES_PASSWORD=postgres",
    "POSTGRES_DB=my_database",
  ]

  restart = "always"

  volumes = [
    "${path.module}/db/script.sql:/docker-entrypoint-initdb.d/script.sql",
    "db_data:/var/lib/postgresql/data",
  ]
}

resource "docker_container" "backend" {
  image = "${docker_image.backend.latest}"
  name  = "backend"

  env = [
    "PORT=4000",
    "DB_HOST=db",
    "DB_PORT=5432",
    "DB_USER=postgres",
    "DB_PASSWORD=postgres",
    "DB_NAME=my_database",
  ]

  restart = "always"

  depends_on = [docker_container.db]
}

resource "docker_container" "frontend" {
  image = "${docker_image.frontend.latest}"
  name  = "frontend"

  restart = "always"
  
  ports {
    internal = 80
    external = 8080
  }

  depends_on = [docker_container.backend]
}

output "frontend_url" {
  value = "http://localhost"
}
