<%@ page import="com.management.movie.models.scene.view.SceneForm" %>
<%@ page import="com.management.movie.models.MovieSet" %>
<%@ page import="com.management.movie.models.MovieCharacter" %>
<%@ page import="com.management.movie.models.Feeling" %>
<%@ page import="com.management.movie.models.HourInterval" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Create scene</title>
</head>
<%
    SceneForm sceneForm = (SceneForm) request.getAttribute("sceneForm");
    String error = (String) request.getAttribute("error");
%>
<body>
    <h3>Create a scene</h3>
    <form method="post" action="${pageContext.request.contextPath}/scene/create" >
        <p>
            Location :
            <select name="movieSet">
                <% for (MovieSet movieSet : sceneForm.getMovieSets()
                        ) { %>
                    <option value="<%= movieSet.getId() %>" > <%= movieSet.getName() %> </option>
                <% } %>
            </select>
        </p>
        <p> 
            Scene number : <input type="text" name="sceneNumber" >
        </p>
        <p>
            Ideal hour :
            <select name="idealHour" id="">
                <% for (HourInterval hourInterval : sceneForm.getHourIntervals()
                ) { %>
                    <option value=" <%= hourInterval.getId() %>" > <%= hourInterval.getStartHour()+" - "+hourInterval.getEndHour() %> </option>
                <% } %>
        </select>
        </p>
        Actions :
        <% for (int i = 0; i < 3; i++) { %>
            <p>
                Character :
                <select name="characters" id="">
                    <option value="">--Character--</option>
                    <% for (MovieCharacter character : sceneForm.getCharacters()
                    ) { %>
                    <option value="<%= character.getId() %>" > <%= character.getName() %> </option>
                    <% } %>
                </select>

                Feeling :
                <select name="feelings" id="">
                    <option value="">--Feeling--</option>
                    <% for (Feeling feeling : sceneForm.getFeelings()
                    ) { %>
                    <option value="<%= feeling.getId() %>" > <%= feeling.getName() %> </option>
                    <% } %>
                </select>

                Script :
                <textarea name="scripts" id="" cols="30" rows="10"></textarea>
                
                Duration : <input type="text" name="durations" id="">
            </p>
        <% } %>
        <p>
            <input type="submit" value="Valider">
        </p>
    </form>
    <% if(error != null) { out.print(error); } %>

</body>
</html>