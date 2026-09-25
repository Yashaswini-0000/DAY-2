# FastAPI CRUD API for Task Management

from fastapi import FastAPI, HTTPException
from pydantic import BaseModel

app = FastAPI(title="Task Management API")

# Temporary in-memory storage
tasks = []
next_id = 1


# Task data model
class Task(BaseModel):
    title: str
    description: str
    completed: bool = False


# CREATE - Add a new task
@app.post("/tasks")
def create_task(task: Task):
    global next_id

    new_task = {
        "id": next_id,
        "title": task.title,
        "description": task.description,
        "completed": task.completed
    }

    tasks.append(new_task)
    next_id += 1

    return {
        "message": "Task created successfully",
        "task": new_task
    }


# READ - View all tasks
@app.get("/tasks")
def get_all_tasks():
    return tasks


# READ - Search task by ID
@app.get("/tasks/{task_id}")
def get_task(task_id: int):

    for task in tasks:
        if task["id"] == task_id:
            return task

    raise HTTPException(
        status_code=404,
        detail="Task not found"
    )


# UPDATE - Update an existing task
@app.put("/tasks/{task_id}")
def update_task(task_id: int, updated_task: Task):

    for task in tasks:

        if task["id"] == task_id:

            task["title"] = updated_task.title
            task["description"] = updated_task.description
            task["completed"] = updated_task.completed

            return {
                "message": "Task updated successfully",
                "task": task
            }

    raise HTTPException(
        status_code=404,
        detail="Task not found"
    )


# DELETE - Delete a task
@app.delete("/tasks/{task_id}")
def delete_task(task_id: int):

    for task in tasks:

        if task["id"] == task_id:

            tasks.remove(task)

            return {
                "message": "Task deleted successfully"
            }

    raise HTTPException(
        status_code=404,
        detail="Task not found"
    )  
