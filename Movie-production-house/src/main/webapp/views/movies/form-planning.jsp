<%@ page import="com.management.movie.models.MovieSet" %>
<%@ page import="java.util.List" %>
<%@include file="../includes/layouts/default/top.jsp"%>
<%
  List<MovieSet> movieSets = (List<MovieSet>) request.getAttribute("movieSets");
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
            <h3>Step 2 : Date et plateaux disponibles </h3>
        </div>
        <!--end::card header-->
        <!--begin::card body-->
        <div class="card-body pt-0">
          <form method="post"  >
            <div class="mb-5">
              <label>Date debut :</label>
              <input type="date" id="begin-date" name="beginDate" class="form-control" placeholder="Date debut">
            </div>
            <div class="mb-5">
              <label>Date fin :</label>
              <input type="date" id="end-date" name="endDate" class="form-control" placeholder="Date fin">
            </div>
            <label class="mb-5">Plateaux disponibles :</label>
            <div id="data">
              <div class="form-group">
                <div data-repeater-list="data">
                  <div data-repeater-item>
                    <div class="mb-5 row">
                      <div class="col-3">
                        <label>Plateau :</label>
                        <select name="movieSet" class="form-select"
                                data-control="select2" data-placeholder="Plateau"
                                data-allow-clear="true">
                          <option value="" >--Location--</option>
                          <% for (MovieSet movieSet : movieSets
                          ) { %>
                          <option value="<%= movieSet.getId() %>" > <%= movieSet.getName() %> </option>
                          <% } %>
                        </select>
                      </div>
                      <div class="col-3">
                        <div class="mb-5">
                          <label>Date debut disponibilite :</label>
                          <input type="datetime-local" name="minDate" class="form-control" placeholder="Date debut">
                        </div>
                      </div>
                      <div class="col-3">
                        <div class="mb-5">
                          <label>Date fin disponibilite :</label>
                          <input type="datetime-local" name="maxDate" class="form-control" placeholder="Date fin">
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
              <button id="submit" class="btn btn-primary"> Plannifier </button>
            </p>
          </form>
          <% if(error != null) { out.print(error); } %>
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

<script>

  $(document).ready(function() {
    $('#submit').click(function(event) {
      event.preventDefault();
      submitForm();
    });
  });

  function prepareFormData (){
    const movieSets = $("select[name='movieSet']");
    let arrMovieSets = [];
    movieSets.each(function() {
      arrMovieSets.push($(this).val());
    });

    const maxDates = $("input[name='maxDate']");
    let arrMaxDates = [];
    maxDates.each(function() {
      arrMaxDates.push($(this).val());
    });

    const minDates = $("input[name='minDate']");
    let arrMinDates = [];
    minDates.each(function() {
      arrMinDates.push($(this).val());
    });

    const scenes = [];
    scenes.push(1);
    scenes.push(2);

    return ( {
        scenes : scenes,
        beginDate : $("#begin-date").val(),
        endDate :  $("#end-date").val() ,
        movieSets : arrMovieSets,
        maxDates : arrMaxDates,
        minDates : arrMinDates,
    } )
  }

  function submitForm() {
    let formData = prepareFormData();
    console.log(formData);

    $.ajax({
      type : "POST",
      contentType : "application/json",
      url : "${pageContext.request.contextPath}/planning/suggestion",
      data : JSON.stringify(formData),
      dataType : 'json',
      success : function(scenes) {
        // $("#result").html("<p>" + "User " + user.name + " with email " + user.email + " has been added." + "</p>");
        console.log("SUCCESS: ", scenes);
      },
      error : function(e) {
        $("#result").html("<p>Error while fetching the list of scenes.</p>");
        console.log("ERROR: ", e);
      }
    });
  }
</script>