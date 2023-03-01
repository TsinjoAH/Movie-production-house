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
                <option value="" >--Location--</option>
                <% for (MovieSet movieSet : sceneForm.getMovieSets()
                        ) {
                    String selected = (movieSet.getId() == scene.getMovieSet().getId()) ? "selected = 'true'" : "";
                %>
                    <option  <%= selected %> value="<%= movieSet.getId() %>" > <%= movieSet.getName() %> </option>
                <% } %>
            </select>
        </p>
        <p> 
            Scene number : <input type="text" name="sceneNumber" value="<%= scene.getSceneNumber() %>"  >
        </p>
        <p>
            Ideal hour :
            <select name="idealHour" id="">
                <option value="" > --Hour-- </option>
                <% for (HourInterval hourInterval : sceneForm.getHourIntervals()
                ) {
                    String selected = (hourInterval.getId() == scene.getHourInterval().getId()) ? "selected = 'true'" : "";
                %>
                    <option <%= selected %> value=" <%= hourInterval.getId() %>" > <%= hourInterval.getStartHour()+" - "+hourInterval.getEndHour() %> </option>
                <% } %>
        </select>
        </p>
        Actions :
        <% for (SceneDetails detail : scene.getSceneDetails()) { %>
            <p>
                Character :
                <select name="characters" id="">
                    <option value="">--Character--</option>
                    <% for (MovieCharacter character : sceneForm.getCharacters()
                    ) {
                        String selected = ( detail.getCharacter() != null && detail.getCharacter().getId()
                                == character.getId()) ? "selected = 'true'" : "";
                    %>
                    <option <%= selected %> value="<%= character.getId() %>" > <%= character.getName() %> </option>
                    <% } %>
                </select>

                Feeling :
                <select name="feelings" id="">
                    <option value="">--Feeling--</option>
                    <% for (Feeling feeling : sceneForm.getFeelings()
                    ) {
                        String selected = ( detail.getFeeling() != null && detail.getFeeling().getId()
                                == feeling.getId()) ? "selected = 'true' " : "";

                    %>
                    <option <%= selected %> value="<%= feeling.getId() %>" > <%= feeling.getName() %> </option>
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