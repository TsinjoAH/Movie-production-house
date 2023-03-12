<%@ page import="com.management.movie.models.planning.Planning" %>
<%@ page import="com.management.movie.models.planning.PlanningElement" %>
<%@include file="../includes/layouts/default/top.jsp"%>
<%@ page import="java.time.format.DateTimeFormatter" %>

<!--begin::main-->
<div class="d-flex flex-column flex-column-fluid">
    <!--begin::toolbar-->
    <div class="app-toolbar py-3 py-lg-6">
        <div class="app-container container-xxl d-flex flex-stack">
            <div class="page-title d-flex flex-column justify-content-center flex-wrap me-3">
                <h1 class="page-heading d-flex text-dark fw-bold fs-3 flex-column justify-content-center my-0">
                    Planning
                </h1>
                <ul class="breadcrumb breadcrumb-separatorless fw-semibold fs-7 my-0 pt-1">
                    <li class="breadcrumb-item text-muted">
                        Movie
                    </li>
                    <li class="breadcrumb-item">
                        <span class="bullet bg-gray-400 w-5px h-2px"></span>
                    </li>
                    <li class="breadcrumb-item text-muted">
                        Planning
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <%
        Planning planning = (Planning) request.getAttribute("planningObject");
    %>
    <!--end::toolbar-->
    <!--begin::content-->
    <div class="app-content flex-column-fluid">
        <div class="app-container container-xxl">
            <div class="card card-flush">
                <div class="card-header align-items-center py-0 gap-2">

                </div>
                <div class="card-body pt-0">
                    <div id="calendar"></div>
                    <div class="mt-5">
                        <form>
                            <table class="table table-striped table-hover">
                                <thead>
                                <tr>
                                    <th>Scene Name</th>
                                    <th>Movie Set</th>
                                    <th>Start Time</th>
                                    <th>End Time</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <% for (PlanningElement element : planning.getElements()) { %>
                                <tr>
                                    <td><%= element.getScene().getSceneNumber() %></td>
                                    <td><%= element.getScene().getMovieSet().getName() %></td>
                                    <td>
                                        <input type="datetime-local"
<%--                                               name="timestampStart<%= element.getScene().getId() %>"--%>
                                               name="timestampStart<%= element.getScene().getId() %>"
                                               id="timestampStart<%= element.getScene().getId() %>"
                                               value="<%= element.getStart().toLocalDateTime().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME) %>">
                                    </td>
                                    <td>
                                        <input type="datetime-local" name="timestampEnd<%= element.getScene().getId() %>"
                                               id="timestampEnd<%= element.getScene().getId() %>"
                                               value="<%= element.getEnd().toLocalDateTime().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME) %>">
                                    </td>
<%--                                    <td><button type="submit" class="btn btn-primary">Save</button></td>--%>
                                </tr>
                                <% } %>
                                </tbody>
                            </table>
                            <button type="submit" class="btn btn-primary">Save</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../includes/layouts/default/bottom.jsp"%>
<script src="${pageContext.request.contextPath}/resources/assets/plugins/custom/fullcalendar/fullcalendar.bundle.js"></script>
<script>
    let data = ${planning};
    let eventList = data.elements.map(function (item) {
        return {
            title: item.scene.sceneNumber,
            start: item.start,
            end: item.end
        }
    });
    $(document).ready(function() {
        let calendarEl = document.getElementById('calendar');
        let calendar = new FullCalendar.Calendar(calendarEl,{
            headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek,timeGridDay'
            },
            height: 800,
            contentHeight: 780,
            initialView: 'dayGridMonth',
            views: {
                dayGridMonth: { buttonText: "Mois" },
                timeGridWeek: { buttonText: "Semaine" },
                timeGridDay: { buttonText: "Jour" },
            },
            editable: false,
            dayMaxEvents: true,
            navLinks: true,
            events: eventList,
            eventContent: function (info) {
                var element = $(info.el);
                element.addClass("min-h3");
                if (info.event.extendedProps && info.event.extendedProps.description) {
                    if (element.hasClass("fc-day-grid-event")) {
                        element.data("content", info.event.extendedProps.description);
                        element.data("placement", "top");
                        KTApp.initPopover(element);
                    } else if (element.hasClass("fc-time-grid-event")) {
                        element.find(".fc-title").append(`<div class="fc-description">` + info.event.extendedProps.description + "</div>");
                    } else if (element.find(".fc-list-item-title").lenght !== 0) {
                        element.find(".fc-list-item-title").append(`<div class="fc-description">` + info.event.extendedProps.description + "</div>");
                    }
                }
            }
        });
        calendar.render();
    })
</script>

