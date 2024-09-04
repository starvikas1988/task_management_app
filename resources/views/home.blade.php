@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{ __('Dashboard') }}</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                    {{ __('You are logged in!') }}
                </div>
                <h1>Your Tasks</h1>
                <div id="task-list"></div>

                <h2>Task (Create/Edit)</h2>
                <form id="task-form">
                    <input type="hidden" name="user_id" id="user_id" value="{{ Auth::user()->id }}">
                    <div class="mb-3">
                        <label for="title" class="form-label">Task Title</label>
                        <input type="text" class="form-control" id="title" placeholder="Task Title" required>
                    </div>
                    <div class="mb-3">
                        <label for="description" class="form-label">Task Description</label>
                        <textarea class="form-control" id="description" placeholder="Task Description"></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="due_date" class="form-label">Due Date</label>
                        <input type="date" class="form-control" id="due_date" required>
                    </div>
                    <div class="mb-3">
                        <label for="priority" class="form-label">Priority</label>
                        <select class="form-select" id="priority">
                            <option value="Low">Low</option>
                            <option value="Medium">Medium</option>
                            <option value="High">High</option>
                        </select>
                    </div>
                    <button type="submit"  id="submit-button" class="btn btn-primary">Create Task</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>
    // Fetch tasks on page load
   // localStorage.clear();

    fetchTasks();


    // Function to fetch tasks
    function fetchTasks() {
       
        axios.get('/api/tasks')
            .then(response => {
                const token = response.data.token.original.token;
             
                
                const tasks = response.data.tasks;

                const user_id = response.data.user_id;
             
                // Store the token in localStorage if not already stored
                if (!localStorage.getItem('api_token')) {
                    localStorage.setItem('api_token', token);
                }

                // Create HTML elements for each task
                let taskListHTML = '';
                tasks.forEach(task => {
                    taskListHTML += `
                        <div class="task-item">
                            <h3>${task.title}</h3>
                            <p>${task.description}</p>
                            <span>Due Date: ${task.due_date}</span>
                            <span>Priority: ${task.priority}</span>
                            <button onclick="editTask(${task.id})">Edit</button>
                            <button onclick="deleteTask(${task.id})">Delete</button>
                        </div>
                    `;
                });

                // Update the #task-list div with the generated HTML
                document.getElementById('task-list').innerHTML = taskListHTML;
            })
            .catch(error => {
                console.error('Error fetching tasks:', error);
            });
    }

    let currentTaskId = null;  // Track the current task being edited (null means create mode)

    document.getElementById('task-form').addEventListener('submit', function(e) {
        e.preventDefault();

        const token = localStorage.getItem('api_token');

        // Set Authorization header for Axios requests
        if (token) {
            axios.defaults.headers.common['Authorization'] = `Bearer ${token}`;
        }

        const taskData = {
            user_id:{{ Auth::user()->id }},
            title: document.getElementById('title').value,
            description: document.getElementById('description').value,
            due_date: document.getElementById('due_date').value,
            priority: document.getElementById('priority').value
        };

        if (currentTaskId) {
            // Update existing task
            axios.put(`/api/tasks/${currentTaskId}`, taskData)
                .then(response => {
                    alert('Task updated successfully!');
                    fetchTasks();  // Refresh task list
                    resetForm();  // Clear the form and reset the state
                })
                .catch(error => {
                    handleError(error);
                });
        } else {
            // Create new task
            axios.post('/api/tasks', taskData)
                .then(response => {
                    alert('Task created successfully!');
                    fetchTasks();  // Refresh task list
                    resetForm();  // Clear the form
                })
                .catch(error => {
                    handleError(error);
                });
        }
    });

    // Function to edit a task (populate the form)
    function editTask(id) {
        const token = localStorage.getItem('api_token');

        // Set Authorization header for Axios requests
        if (token) {
            axios.defaults.headers.common['Authorization'] = `Bearer ${token}`;
        }

        axios.get(`/api/tasks/${id}`)
            .then(response => {
                let task = response.data;

                // Populate the form fields with task data
                document.getElementById('title').value = task.title;
                document.getElementById('description').value = task.description;
                document.getElementById('due_date').value = task.due_date;
                document.getElementById('priority').value = task.priority;

                // Set currentTaskId to the ID of the task being edited
                currentTaskId = id;
                 // Change the button text to "Update Task"
                document.getElementById('submit-button').textContent = 'Update Task';
            })
            .catch(error => {
                console.error('Error fetching task for editing:', error);
            });
    }

    // Function to reset the form and state
    function resetForm() {
        // Clear form fields
        document.getElementById('task-form').reset();

        // Reset currentTaskId to null (switch back to create mode)
        currentTaskId = null;
        // Change the button text back to "Create Task"
        document.getElementById('submit-button').textContent = 'Create Task';
    }

    // Function to handle errors
    function handleError(error) {
        if (error.response) {
            console.error('Error response:', error.response.data);
            console.error('Error status:', error.response.status);
            console.error('Error headers:', error.response.headers);
            alert(`Error: ${error.response.data.message || 'Failed to process task.'}`);
        } else if (error.request) {
            console.error('Error request:', error.request);
        } else {
            console.error('Error message:', error.message);
        }
    }

    // Function to delete a task
    function deleteTask(id) {
        const token = localStorage.getItem('api_token');

        // Set Authorization header for Axios requests
        if (token) {
            axios.defaults.headers.common['Authorization'] = `Bearer ${token}`;
        }

        if (confirm('Are you sure you want to delete this task?')) {
            axios.delete(`/api/tasks/${id}`)
                .then(response => {
                    alert('Task deleted successfully!');
                    fetchTasks();  // Refresh task list
                })
                .catch(error => {
                    console.error('Error deleting task:', error);
                });
        }
    }
</script>
@endsection
