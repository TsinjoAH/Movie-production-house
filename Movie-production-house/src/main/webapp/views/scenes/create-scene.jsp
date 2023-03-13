<%@ page import="com.management.movie.models.scene.view.SceneForm" %>
<%@ page import="com.management.movie.models.movieSet.MovieSet" %>
<%@ page import="com.management.movie.models.MovieCharacter" %>
<%@ page import="com.management.movie.models.Feeling" %>
<%@ page import="com.management.movie.models.HourInterval" %>
<%@include file="../includes/layouts/default/top.jsp"%>
<%
    SceneForm sceneForm = (SceneForm) request.getAttribute("sceneForm");
    String error = (String) request.getAttribute("error");
%>
<!--begin::main-->
<div class="d-flex flex-column flex-column-fluid">
    <!--begin::toolbar-->
    <div class="app-toolbar py-3 py-lg-6">
        <div class="app-container container-xxl d-flex flex-stack">
            <div class="page-title d-flex flex-column justify-content-center flex-wrap me-3">
                <h1 class="page-heading d-flex text-dark fw-bold fs-3 flex-column justify-content-center my-0">
                    Ajouter une scene
                </h1>
                <ul class="breadcrumb breadcrumb-separatorless fw-semibold fs-7 my-0 pt-1">
                    <li class="breadcrumb-item text-muted">
                        Scenes
                    </li>
                    <li class="breadcrumb-item">
                        <span class="bullet bg-gray-400 w-5px h-2px"></span>
                    </li>
                    <li class="breadcrumb-item text-muted">
                        Formulaire
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
                </div>
                <!--end::card header-->
                <!--begin::card body-->
                <div class="card-body pt-0">
                    <form method="post" action="${pageContext.request.contextPath}/scene/create" >
                        <div class="mb-5">
                            <label>Plateau :</label>
                            <select name="movieSet" class="form-select"
                                    data-control="select2" data-placeholder="Plateau"
                                    data-allow-clear="true">
                                <option value="" >--Location--</option>
                                <% for (MovieSet movieSet : sceneForm.getMovieSets()
                                ) { %>
                                <option value="<%= movieSet.getId() %>" > <%= movieSet.getName() %> </option>
                                <% } %>
                            </select>
                        </div>
                        <div class="mb-5">
                            <label>Numéro de la scène :</label>
                            <input type="text" name="sceneNumber" class="form-control" placeholder="Numéro de la scène">
                        </div>
                        <div class="mb-5">
                            Intervalle de préférence
                            <select name="idealHour" class="form-select"
                                    data-control="select2" data-placeholder="Plateau"
                                    data-allow-clear="true">
                                <% for (HourInterval hourInterval : sceneForm.getHourIntervals()
                                ) { %>
                                <option value=" <%= hourInterval.getId() %>" > <%= hourInterval.getStartHour()+" - "+hourInterval.getEndHour() %> </option>
                                <% } %>
                            </select>
                        </div>
                        <label class="mb-5">Actions :</label>
                        <div id="data">
                            <div class="form-group">
                                <div data-repeater-list="data">
                                    <div data-repeater-item>
                                        <div class="mb-5 row">
                                            <div class="col-2">
                                                <label>Personnage :</label>
                                                <select name="characters" class="form-select"
                                                        data-control="select2" data-placeholder="Personnage"
                                                        data-allow-clear="true">
                                                    <option value="">--Personnage--</option>
                                                    <% for (MovieCharacter character : sceneForm.getCharacters()
                                                    ) { %>
                                                    <option value="<%= character.getId() %>" > <%= character.getName() %> </option>
                                                    <% } %>
                                                </select>
                                            </div>

                                            <div class="col-2">
                                                <label>Emotion :</label>
                                                <select name="feelings" class="form-select"
                                                        data-control="select2" data-placeholder="Emotion"
                                                        data-allow-clear="true">
                                                    <option value="">--Emotion--</option>
                                                    <% for (Feeling feeling : sceneForm.getFeelings()
                                                    ) { %>
                                                    <option value="<%= feeling.getId() %>" > <%= feeling.getName() %> </option>
                                                    <% } %>
                                                </select>
                                            </div>
                                            <div class="col-4">
                                                <label>Description :</label>
                                                <textarea name="scripts" class="form-control" data-kt-autosize="true"></textarea>
                                            </div>
                                            <div class="col-2">
                                                <label>Durée</label>
                                                <input type="text" name="durations" class="form-control">
                                            </div>
                                            <div class="col-2">
                                                <button data-repeater-delete class="btn btn-sm btn-light-danger mt-3 mt-md-8" type="button">
                                                    <i class="la la-trash-o"></i>Delete
                                                    
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mt-5">
                                <button data-repeater-create class="btn btn-light-primary" type="button">
                                    <i class="la la-plus"></i>Add
                                </button>
                            </div>
                        </div>
                        <p>
                            <input type="submit" value="Ajouter" class="btn btn-primary">
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