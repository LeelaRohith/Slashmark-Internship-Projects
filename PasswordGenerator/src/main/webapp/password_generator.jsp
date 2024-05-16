<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Password Generator</title>
    <link rel="stylesheet" type="text/css" href="password_generator_styles.css">
</head>
<body>
<div class="container">
    <h2>Password Generator</h2>
    <% StringBuilder password = (StringBuilder)request.getAttribute("password");%>
    <form action="generatePassword" method="post">
     <div class="checkboxes">
                    <div>
                 <label><input type="checkbox" name="uppercase" checked> Uppercase letters</label>
                 <input type="hidden" name="uppercaseChecked" value="true">
             </div>
             <div>
                 <label><input type="checkbox" name="lowercase" > Lowercase letters</label>
                 <input type="hidden" name="lowercaseChecked" value="false">
             </div>
             <div>
                 <label><input type="checkbox" name="numbers" > Numbers</label>
                 <input type="hidden" name="numbersChecked" value="false">
             </div>
             <div>
                 <label><input type="checkbox" name="symbols"> Symbols</label>
                 <input type="hidden" name="symbolsChecked" value="false">
             </div>
         </div>
         <div class="characters">
             <label style="margin-top:15px">Number of characters: <span id="charCount">8</span></label>
             <input type="range" name="charCount" min="8" max="15" value="8" oninput="updateCharCount(this.value)"><br>
         </div>
        
        <button type="submit">Generate Password</button>
    </form>
    <%if(password.length()>0){ %>
     <div class="generated-password">
            <strong>Generated Password:</strong><%=password %>
        </div>
    <%}%>
</div>
<script>
    function updateCharCount(value) {
        document.getElementById('charCount').innerText = value;
    }
    document.querySelectorAll('.checkboxes input[type="checkbox"]').forEach(function(checkbox) {
        checkbox.addEventListener('click', function() {
            document.querySelector('input[name="' + checkbox.name + 'Checked"]').value = checkbox.checked.toString();
        });
    });
</script>

</body>
</html>
