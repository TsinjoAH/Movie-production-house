<%@ page import="com.management.movie.models.MovieSet" %>
<%@ page import="java.util.List" %>
<%@ page import="com.management.movie.models.scene.Scene" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@include file="../includes/layouts/default/top.jsp"%>
<%
  HashMap<Integer, MovieSet> movieSets = (HashMap<Integer, MovieSet>) request.getAttribute("movieSets");
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
            <label class="mb-5">Plateaux disponibles :</label>
            <% for (Map.Entry<Integer, MovieSet> set : movieSets.entrySet()
            ) { %>
              <div class="mb-5 row">
                <div class="col-3">
                  <input type="hidden" name="movieSets" value="<%= set.getKey()%>">
                  <bold>  <%= set.getValue().getName() %>  </bold>
                </div>
                <div class="col-3">
                  <div class="mb-5">
                    <label>Date debut disponibilite :</label>
                    <input type="datetime-local" name="minDates" class="form-control" placeholder="Date debut">
                  </div>
                </div>
                <div class="col-3">
                  <div class="mb-5">
                    <label>Date fin disponibilite :</label>
                    <input type="datetime-local" name="maxDates" class="form-control" placeholder="Date fin">
                  </div>
                </div>
              </div>
            <% } %>

            <div id="data">
              <div class="form-group">
                <div data-repeater-list="data">
                  <div data-repeater-item>
                    <div class="mb-5 row">
                      <div class="col-3">
                        <label>Plateau :</label>
                        <select name="movieSets" class="form-select"
                                data-control="select2" data-placeholder="Plateau"
                                data-allow-clear="true">
                          <option value="" >--Location--</option>
                          <% for (Map.Entry<Integer, MovieSet> set : movieSets.entrySet()
                          ) { %>
                          <option value="<%= set.getKey() %>" > <%= set.getValue().getName() %> </option>
                          <% } %>
                        </select>
                      </div>
                      <div class="col-3">
                        <div class="mb-5">
                          <label>Date debut disponibilite :</label>
                          <input type="datetime-local" name="minDates" class="form-control" placeholder="Date debut">
                        </div>
                      </div>
                      <div class="col-3">
                        <div class="mb-5">
                          <label>Date fin disponibilite :</label>
                          <input type="datetime-local" name="maxDates" class="form-control" placeholder="Date fin">
                        </div>
                      </div>
                      <div class="col-2">
                        <button data-repeater-delete class="btn btn-sm btn-light-danger mt-3 mt-md-8" type="button">
                          <i class="la la-trash-o"></i>Delete
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="form-group mt-5 mb-5">
                <button data-repeater-create class="btn btn-light-primary" type="button">
                  <i class="la la-plus"></i>Add
                </button>
              </div>
            </div>
            <p>
              <input type="submit" class="btn btn-primary" value="Plannifier" />
            </p>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.repeater/1.2.1/jquery.repeater.min.js" integrity="sha512-foIijUdV0fR0Zew7vmw98E6mOWd9gkGWQBWaoA1EOFAx+pY+N8FmmtIYAVj64R98KeD2wzZh1aHK0JSpKmRH8w==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
  $("#data").repeater({
    initEmpty: true,
    defaultValues: {
      'text-input': 'foo'
    },
    show: function () {
      $(this).slideDown();
      // redonner aux inputs leur nom original
      $('#data').find('[name]').each(function () {
        var name = $(this).attr('name');
        $(this).attr('name',name.match(/\w+(?=]$)/)[0])
      });
    },
    hide: function (deleteElement) {
      $(this).slideUp(deleteElement);
    },
  })
</script>