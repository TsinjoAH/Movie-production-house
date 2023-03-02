<%@ page import="com.management.movie.models.MovieSet" %>
<%@ page import="java.util.List" %>
<%@ page import="com.management.movie.models.MovieCharacter" %>
<%@ page import="com.management.movie.models.scene.SceneReturn" %>
<%@ page import="com.management.movie.models.scene.Scene" %>
<%@include file="../includes/layouts/default/top.jsp"%>
<%
    List<MovieSet> movieSets = (List<MovieSet>) request.getAttribute("movieSetList");
    List<MovieCharacter> characters = (List<MovieCharacter>) request.getAttribute("characterList");
    SceneReturn sceneReturn = (SceneReturn) request.getAttribute("sceneReturn");
%>

<!--begin::main-->
<div class="d-flex flex-column flex-column-fluid">
    <!--begin::toolbar-->
    <div class="app-toolbar py-3 py-lg-6">
        <div class="app-container container-xxl d-flex flex-stack">
            <div class="page-title d-flex flex-column justify-content-center flex-wrap me-3">
                <h1 class="page-heading d-flex text-dark fw-bold fs-3 flex-column justify-content-center my-0">
                    Scenes
                </h1>
                <ul class="breadcrumb breadcrumb-separatorless fw-semibold fs-7 my-0 pt-1">
                    <li class="breadcrumb-item text-muted">
                        Scenes
                    </li>
                    <li class="breadcrumb-item">
                        <span class="bullet bg-gray-400 w-5px h-2px"></span>
                    </li>
                    <li class="breadcrumb-item text-muted">
                        Liste
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!--end::toolbar-->
    <!--begin::content-->
    <div class="app-content flex-column-fluid">
        <div class="app-container container-xxl">
            <!--begin::card-->
            <div class="card card-flush">
                <!--begin::card header-->
                <div class="card-header align-items-center py-0 gap-2">
                    <div class="card-toolbar flex-row-fluid justify-content-end gap-5" data-select2-id="select2-data-123-mzxj">
                        <!--begin::Add product-->
                        <a href="${pageContext.request.contextPath}/scene/create" class="btn btn-primary">
                            Ajouter une scène
                        </a>
                        <!--end::Add product-->
                    </div>
                </div>
                <!--end::card header-->
                <!--begin::card body-->
                <div class="card-body pt-0">
                    <div class="accordion" id="accordion-1">
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="accordion-header">
                                <button class="accordion-button fs-4 fw-semibold" type="button" data-bs-toggle="collapse"
                                        data-bs-target="#accordion-body" aria-expanded="true" aria-controls="accordion-body">
                                    Filtres
                                </button>
                            </h2>
                            <div id="accordion-body" class="accordion-collapse collapse show" aria-labelledby="accordion-header"
                                 data-bs-parent="#accordion-1">
                                <div class="accordion-body">
                                    <form method="get">
                                        <div class="mb-5">
                                            <label>Numero de la scene :</label>
                                            <input id="scene-number" type="text" class="form-control" placeholder="Nom de la scene" name="sceneNumber">
                                        </div>
                                        <div class="mb-5">
                                            <label>Plateau</label>
                                            <select id="movie-set" class="form-select" name="movieSet.id"
                                                    data-control="select2" data-placeholder="Plateau"
                                                    data-allow-clear="true">
                                                <% for(MovieSet movieSet : movieSets) { %>
                                                <option value="<%=movieSet.getId()%>"><%=movieSet.getName()%></option>
                                                <% } %>
                                            </select>
                                        </div>
                                        <div class="mb-5">
                                            <label>Acteur</label>
                                            <select id="actor" class="form-select" data-control="select2" name="movieCharacter.id"
                                                    data-placeholder="Acteur"
                                                    data-allow-clear="true">
                                                <% for(MovieCharacter character : characters) { %>
                                                <option value="<%=character.getId()%>"><%=character.getName()%></option>
                                                <% } %>
                                            </select>
                                        </div>
                                        <div class="mb-5">
                                            <label>Tranche horraire idéale minimum :</label>
                                            <input type="time" class="form-control" id="ideal-hour-min" placeholder="Tranche horraire idéale minimum" name="begin">
                                        </div>
                                        <div class="mb-5">
                                            <label>Tranche horraire idéale maximum :</label>
                                            <input class="form-control" id="ideal-hour-max" placeholder="Tranche horraire idéale maximum" name="end">
                                        </div>
                                        <button class="btn btn-primary" type="submit">
                                            Filtrer
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!--begin::table-->
                        <table class="table table-row-bordered gy-5" id="scenes-list">
                            <thead>
                            <tr class="fw-semibold fs-6 text-muted">
                                <th>Numéro de scène</th>
                                <th>Acteurs</th>
                                <th>Plateau</th>
                                <th>Début de la tranche horraire idéale</th>
                                <th>Fin de la tranche horraire idéale</th>
                                <th>Mettre à jour</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%for(Scene scene : sceneReturn.getSceneList()) {%>
                            <tr>
                                <td><%=scene.getSceneNumber()%></td>
                                <td> - </td>
                                <td><%=scene.getMovieSet().getName()%></td>
                                <td><%=scene.getHourInterval().getStartHour()%></td>
                                <td><%=scene.getHourInterval().getEndHour()%></td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/scene/update/<%= scene.getId() %>" >
                                        Modifier
                                    </a>
                                </td>
                            </tr>
                            <%}%>
                            </tbody>
                        </table>
                        <!--end::table-->
                    </div>
                    <!--end::card body-->
                </div>
                <!--end::card-->
            </div>
        </div>
        <!--end:content-->
    </div>
    <!--end::main-->
    <%@include file="../includes/layouts/default/bottom.jsp"%>
    <script>
        $("#estimated-time-picker-min").flatpickr({
            enableTime: true,
            noCalendar: true,
            dateFormat: "H:i",
            time_24hr:true
        });
        $("#estimated-time-picker-max").flatpickr({
            enableTime: true,
            noCalendar: true,
            dateFormat: "H:i",
            time_24hr:true
        });
        $("#ideal-hour-min").flatpickr({
            enableTime: true,
            noCalendar: true,
            dateFormat: "H:i",
            time_24hr:true
        });
        $("#ideal-hour-max").flatpickr({
            enableTime: true,
            noCalendar: true,
            dateFormat: "H:i",
            time_24hr:true
        });
    </script>
