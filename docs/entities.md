📚 Entidades principales
-------------------------
User
- id: Long
- username: String
- email: String
- password: String
- Relaciones: proyectos, tareas, comentarios

Project
- id: Long
- name: String
- description: String
- owner: User
- members: List<User>
- boards: List<Board>

Board
- id: Long
- name: String ("Por hacer", "En progreso", "Hecho")
- project: Project
- tasks: List<Task>

Task
- id: Long
- title: String
- description: String
- assignedTo: User
- board: Board
- dueDate: Date
- priority: Enum (LOW, MEDIUM, HIGH)
- comments: List<Comment>

Comment
- id: Long
- task: Task
- author: User
- message: String
- createdAt: Date

🧾 Uso de Enumeraciones (Enums)
-------------------------------

El proyecto utiliza `enum`s para representar valores limitados y semánticos, mejorando la claridad y evitando errores comunes:

- `TaskPriority`: LOW, MEDIUM, HIGH
- `TaskStatus` (opcional): TODO, IN_PROGRESS, DONE
- `UserRole`: ADMIN, MEMBER, VIEWER
- `ProjectVisibility` (futuro): PRIVATE, PUBLIC

Esto permite mayor control de datos y facilita la validación, filtrado y representación visual.
