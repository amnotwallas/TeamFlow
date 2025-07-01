-- Tabla de usuarios
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

-- Tabla de proyectos
CREATE TABLE projects (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    owner_id INT REFERENCES users(id) ON DELETE SET NULL,
    visibility VARCHAR(10) DEFAULT 'PRIVATE' -- ProjectVisibility enum en Java
);

-- Tabla intermedia: usuarios asignados a proyectos, con roles
CREATE TABLE project_members (
    project_id INT REFERENCES projects(id) ON DELETE CASCADE,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    role VARCHAR(10) DEFAULT 'MEMBER', -- UserRole enum en Java
    PRIMARY KEY (project_id, user_id)
);

-- Tabla de tableros dentro de proyectos (Por hacer, En progreso, Hecho)
CREATE TABLE boards (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    project_id INT REFERENCES projects(id) ON DELETE CASCADE
);

-- Tabla de tareas
CREATE TABLE tasks (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    assigned_to INT REFERENCES users(id) ON DELETE SET NULL,
    board_id INT REFERENCES boards(id) ON DELETE CASCADE,
    due_date DATE,
    priority VARCHAR(10), -- TaskPriority enum en Java
    status VARCHAR(15) DEFAULT 'TODO' -- TaskStatus enum en Java
);

-- Tabla de comentarios en tareas
CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    task_id INT REFERENCES tasks(id) ON DELETE CASCADE,
    author_id INT REFERENCES users(id) ON DELETE SET NULL,
    message TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
