<%@ page import="com.management.movie.models.movieSet.MovieSet" %>
<%@ page import="java.util.List" %>
<%@ page import="com.management.movie.models.scene.Scene" %>
<%@include file="../includes/layouts/default/top.jsp"%>
<%
  List<MovieSet> movieSets = (List<MovieSet>) request.getAttribute("movieSets");
  List<Scene> scenes = (List<Scene>) request.getAttribute("scenes");
  String error = (String) request.getAttribute("error");
%>
<!--begin::main-->
<div class="d-flex flex-column flex-column-fluid">
  <!--begin::toolbar-->
  <div class="app-toolbar py-3 py-lg-6">
    <div class="app-container container-xxl d-flex flex-stack">
      <div class="page-title d-flex flex-column justify-content-center flex-wrap me-3">
        <h1 class="page-heading d-flex text-dark fw-bold fs-3 flex-column justify-content-center my-0">
          Suggestion planning
        </h1>
        <ul class="breadcrumb breadcrumb-separatorless fw-semibold fs-7 my-0 pt-1">
          <li class="breadcrumb-item text-muted">
            Planning
          </li>
          <li class="breadcrumb-item">
            <span class="bullet bg-gray-400 w-5px h-2px"></span>
          </li>
          <li class="breadcrumb-item text-muted">
            Suggestion
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
          <h3>Liste des plannifications en cours</h3>
        </div>
        <!--end::card header-->
        <!--begin::card body-->
        <div class="card-body pt-0">
          <table class="table table-row-bordered gy-5" id="scenes-list">
            <thead>
            <tr class="fw-semibold fs-6 text-muted">
              <th>Numéro de scène</th>
              <th>Acteurs</th>
              <th>Plateau</th>
              <th>Début de la tranche horraire idéale</th>
              <th>Fin de la tranche horraire idéale</th>
              <th>Enlever</th>
            </tr>
            </thead>
            <tbody>
            <%for(Scene scene : scenes) {%>
            <tr>
              <td><%=scene.getSceneNumber()%></td>
              <td> - </td>
              <td><%=scene.getMovieSet().getName()%></td>
              <td><%=scene.getHourInterval().getStartHour()%></td>
              <td><%=scene.getHourInterval().getEndHour()%></td>
              <td>
                <a href="${pageContext.request.contextPath}/scenes/ongoing-plan/remove/<%= scene.getId() %>" >
                  Enlever
                </a>
              </td>
            </tr>
            <%}%>
            </tbody>
          </table>
        </div>
      </div>


      <div class="card card-flush">
        <!--begin::card header-->
        <div class="card-header align-items-center py-0 gap-2">
            <h3>Date et plateau disponibles</h3>
        </div>
        <!--end::card header-->
        <!--begin::card body-->
        <div class="card-body pt-0">
          <form method="post" action="${pageContext.request.contextPath}/planning/suggestion"  >
            <div class="mb-5">
              <label>Date debut :</label>
              <input type="date" id="begin-date" name="beginDate" class="form-control" placeholder="Date debut">
            </div>
            <div class="mb-5">
              <label>Date fin :</label>
              <input type="date" id="end-date" name="endDate" class="form-control" placeholder="Date fin">
            </div>
            <input type="submit" class="btn btn-primary" value="Plannifier" />
          </form>
          <%if(error != null) { %>
            <div class="alert alert-danger" role="alert">
              <%= error %>
            </div>
          <% } %>
        </div>
      </div>
    </div>
  </div>
</div>
<%@include file="../includes/layouts/default/bottom.jsp"%>
