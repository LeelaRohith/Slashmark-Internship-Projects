<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.tasklistApp.data.Task" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Task List Application</title>
<link href ="tasklist_styles.css" type ="text/css" rel ="stylesheet"></link>
</head>
<body>
<div class="navbar">
        <h1>Task List Application</h1>
    </div>
<div class="container">
<form action="addTask" method="post" class="task-input">

            <input type="text" id="newTaskInput" name="newTaskInput" placeholder="Enter new task...">
            <button id="addTaskBtn" type="submit">Add New Task</button> 
 </form>
<div class="task-list">
    <table>
         <% 
    ArrayList<Task> tasks = (ArrayList<Task>) request.getAttribute("tasks");
    if (tasks != null  && !tasks.isEmpty()) {%>
    <thead>
        <tr>
        <th style="width:2px">S.No</th>
        <th>Tasks</th>
        </tr>
        
        </thead>
        <tbody>
        <% for (Task task : tasks) { %>

            <tr>
    <td style="width:2px"><%= task.getId() %></td>
    <td>
        <span class="task-name" data-task-id="<%= task.getId() %>"><%= task.getName() %></span>
        <span class="edit-mode" data-task-id="<%= task.getId() %>" style="display: none;">
            <form action="editTask" method="post" style="display:inline">
                <input type="hidden" name="taskId" value="<%= task.getId() %>">
                <input type="text" name="editedTask" value="<%= task.getName() %>">
                <button type="submit">Save</button>
                <button type="button" onclick="cancelEdit('<%= task.getId() %>')">Cancel</button>
            </form>
        </span>
        <span class="action-buttons">
            <button class="edit-btn" onclick="toggleEdit('<%= task.getId() %>')">Edit</button>
            <a href="deleteTask?taskId=<%= task.getId() %>"><button class="delete-btn">Delete</button></a>
        </span>
    </td>
</tr>
            
<%
        } // end for loop
    } // end if check
%>
        </tbody>
    </table>
</div>
</div>
<script>
function toggleEdit(taskId) {
    var taskNameSpan = document.querySelector('.task-name[data-task-id="' + taskId + '"]');
    var editModeSpan = document.querySelector('.edit-mode[data-task-id="' + taskId + '"]');

    if (taskNameSpan && editModeSpan) {
        taskNameSpan.style.display = 'none';
        editModeSpan.style.display = 'inline';
    }
    
}
function cancelEdit(taskId) {
    var taskNameSpan = document.querySelector('.task-name[data-task-id="' + taskId + '"]');
    var editModeSpan = document.querySelector('.edit-mode[data-task-id="' + taskId + '"]');

    if (taskNameSpan && editModeSpan) {
        taskNameSpan.style.display = 'inline';
        editModeSpan.style.display = 'none';
    }
}
</script>

</body>
</html>