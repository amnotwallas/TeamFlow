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
- createdAt: Dat