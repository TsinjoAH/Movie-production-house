<%@ page import="com.management.movie.models.movieSet.MovieSet" %>
<%@ page import="java.util.List" %>
<%@ page import="com.management.movie.models.scene.Scene" %>
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
                    Plateau disponible
                </h1>
                <ul class="breadcrumb breadcrumb-separatorless fw-semibold fs-7 my-0 pt-1">
                    <li class="breadcrumb-item text-muted">
                        Plateau
                    </li>
                    <li class="breadcrumb-item">
                        <span class="bullet bg-gray-400 w-5px h-2px"></span>
                    </li>
                    <li class="breadcrumb-item text-muted">
                        Insertion disponible
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
                    <h3>plateau disponibles</h3>
                </div>
                <!--end::card header-->
                <!--begin::card body-->
                <div class="card-body pt-0">
                    <form method="post" action="${pageContext.request.contextPath}/available-movieset/create"  >
                        <div class="mb-5">

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

                        <div class="mb-5">
                            <label>Date debut disponibilite :</label>
                            <input type="datetime-local" name="minDate" class="form-control" placeholder="Date debut">
                        </div>

                        <div class="mb-5">
                            <label>Date fin disponibilite :</label>
                            <input type="datetime-local" name="maxDate" class="form-control" placeholder="Date fin">
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
