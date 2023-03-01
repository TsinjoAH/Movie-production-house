<%@ page import="com.management.movie.models.scene.view.SceneForm" %>
<%@ page import="com.management.movie.models.MovieSet" %>
<%@ page import="com.management.movie.models.MovieCharacter" %>
<%@ page import="com.management.movie.models.Feeling" %>
<%@ page import="com.management.movie.models.HourInterval" %>
<%@ page import="com.management.movie.models.scene.Scene" %>
<%@ page import="com.management.movie.models.scene.SceneDetails" %>
<%@include file="../includes/layouts/default/top.jsp"%>
<%
    SceneForm sceneForm = (SceneForm) request.getAttribute("sceneForm");
    Scene scene = (Scene) request.getAttribute("scene");
    String error = (String) request.getAttribute("error");
%>
<body>
    <h3>Update a scene</h3>
    <form method="post" action="${pageContext.request.contextPath}/scene/update?sceneId=<%= scene.getId() %>" >
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
            Scene number : <input type="text" name="sceneNumber" value="<%= scene.getSceneNumber() %>"  >
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
        <% for (SceneDetails detail : scene.getSceneDetails()) { %>
            <p>
                Character :
                <select name="characters" id="">
                    <% if(detail.getCharacter() != null) { %>
                        <option value="<%= detail.getCharacter().getId() %>"><%= detail.getCharacter().getName() %></option>
                    <% } else { %>
                        <option value="">--Character--</option>
                    <% } %>
                    <% for (MovieCharacter character : sceneForm.getCharacters()
                    ) { %>
                    <option value="<%= character.getId() %>" > <%= character.getName() %> </option>
                    <% } %>
                </select>

                Feeling :
                <select name="feelings" id="">
                    <% if(detail.getFeeling() != null) { %>
                         <option value="<%= detail.getFeeling().getId() %>"><%= detail.getFeeling().getName()  %> </option>
                    <% } else{ %>
                        <option value="">--Feeling--</option>
                    <% } %>
                    <% for (Feeling feeling : sceneForm.getFeelings()
                    ) { %>
                    <option value="<%= feeling.getId() %>" > <%= feeling.getName() %> </option>
                    <% } %>
                </select>

                Script :
                <textarea name="scripts" id="" cols="30" rows="10"><%= detail.getScript() %></textarea>
                
                Duration : <input type="text" name="durations" id="" value="<%= detail.getDuration() %>">
            </p>
        <% } %>
        <p>
            <input type="submit" value="Valider">
        </p>
    </form>
    <% if(error != null) { out.print(error); } %>

</body>
<%@include file="../includes/layouts/default/bottom.jsp"%>