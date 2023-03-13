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
          <h3>Liste des scènes à plannifier</h3>
        </div>
        <!--end::card header-->
        <!--begin::card body-->
        <div class="card-body pt-0" id="scenes-list">
          <table class="table table-row-bordered gy-5">
            <thead>
            <tr class="fw-semibold fs-6 text-muted">
              <th>Numéro de scène</th>
              <th>Acteurs</th>
              <th>Plateau</th>
              <th>Début de la tranche horraire idéale</th>
              <th>Fin de la tranche horraire idéale</th>
            </tr>
            </thead>
            <tbody data-repeater-list="scene-list">
            <tr data-repeater-item>
              <td>
                <select name="scene" class="form-select scene-select" onclick="setCurrentFocus(this)" onchange="addScene(this)">
                  <option value="" >--Scène--</option>
                </select>
              </td>
              <td class="scene-actors"></td>
              <td class="scene-set"></td>
              <td class="scene-start-time"></td>
              <td class="scene-end-time"></td>
              <td>
                <button data-repeater-delete class="btn btn-sm btn-light-danger mt-3 mt-md-8" type="button">
                  <i class="la la-trash-o"></i>Delete
                </button>
              </td>
            </tr>
            </tbody>
          </table>
          <button data-repeater-create class="btn btn-light-primary" type="button" id="add-scene">
            <i class="la la-plus"></i>Add
          </button>
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
                <button data-repeater-create class="btn btn-light-primary" type="button" >
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

  $("#scenes-list").repeater({
    initEmpty: true,
    defaultValues: {
      'text-input': 'foo'
    },
    show: function () {
      $(this).slideDown();
      // redonner aux inputs leur nom original
      $('#scenes-list').find('[name]').each(function () {
        let name = $(this).attr('name');
        $(this).attr('name',name.match(/\w+(?=]$)/)[0])
      });
      addLine()
      updateOptions()
    },
    hide: function (deleteElement) {
      $(this).slideUp(deleteElement);
      remove($(this).find('.scene-select'))
      updateOptions()
    },
  })

  let count = 0;
  let scenes = [
          {id:"1", number:"scene 1", actors:"Jean, Jacques, Annie", set:"Salon 1",start:"12:00:00",end:"12:59:59"},
          {id:"2", number:"scene 2", actors:"Cedric, Koto", set:"Salon 2",start:"13:00:00",end:"13:59:59"},
          {id:"3", number:"scene 3", actors:"Jean, Jacques, Annie", set:"Salon 1",start:"14:00:00",end:"14:59:59"},
          {id:"4", number:"scene 4", actors:"Cedric, Koto", set:"Salon 2",start:"15:00:00",end:"15:59:59"},
          {id:"5", number:"scene 5", actors:"Jean, Jacques, Annie", set:"Salon 1",start:"16:00:00",end:"16:59:59"},
  ]
  let maxCount = scenes.length;
  let excluded = []
  let currentFocus = "0";

  function remove(input) {
    count--;
    if(count < maxCount) {
      document.getElementById("add-scene").disabled = false;
    }
    const id = input.val()
    excluded = excluded.filter((item) => item !== id)
  }

  function addLine() {
    count++;
    if(count === maxCount) {
      document.getElementById("add-scene").disabled = true;
    }
  }

  function setCurrentFocus(input) {
    currentFocus = input.value;
  }

  function addScene(input) {
    excluded.push(input.value)
    const scene = scenes.find((item) => item.id === input.value)
    $(input).parent().siblings(".scene-actors").text(scene.actors)
    $(input).parent().siblings(".scene-set").text(scene.set)
    $(input).parent().siblings(".scene-start-time").text(scene.start)
    $(input).parent().siblings(".scene-end-time").text(scene.end)
    excluded = excluded.filter((item) => item !== currentFocus)
    updateOptions()
  }

  function updateOptions() {
    $(".scene-select").each(function () {
      const value = $(this).val()
      // enlever toutes les options
      $(this).find('option').remove();
      // ajouter les options en fonction des scenes
      const select = $(this)
      scenes.forEach(function (scene) {
        if(excluded.indexOf(scene.id) === -1 || value === scene.id)
        {
          select.append('<option value="' + scene.id + '">' + scene.number + '</option>');
        }
      });
      select.val(value)
    });
  }
</script>