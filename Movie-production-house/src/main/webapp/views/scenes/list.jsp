<%@include file="../includes/layouts/default/top.jsp"%>
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
                        <a href="${pageContext.request.contextPath}/scenes/form" class="btn btn-primary">
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
                                    <div class="mb-5">
                                        <label>Nom de la scene :</label>
                                        <input type="text" class="form-control" placeholder="Nom de la scene">
                                    </div>
                                    <div class="mb-5">
                                        <label>Plateaux</label>
                                        <select class="form-select" data-control="select2"
                                                data-close-on-select="false" data-placeholder="Plateaux"
                                                data-allow-clear="true" multiple="multiple">
                                            <option></option>
                                            <option value="1">Option 1</option>
                                            <option value="2">Option 2</option>
                                        </select>
                                    </div>
                                    <div class="mb-5">
                                        <label>Durée estimée minimum :</label>
                                        <input type="time" class="form-control" id="estimated-time-picker-min" placeholder="Durée estimée minimum">
                                    </div>
                                    <div class="mb-5">
                                        <label>Durée estimée maximum :</label>
                                        <input type="time" class="form-control" id="estimated-time-picker-max" placeholder="Durée estimée maximum">
                                    </div>
                                    <div class="mb-5">
                                        <label>Tranche horraire idéale minimum :</label>
                                        <input type="time" class="form-control" id="ideal-hour-min" placeholder="Tranche horraire idéale minimum">
                                    </div>
                                    <div class="mb-5">
                                        <label>Tranche horraire idéale maximum :</label>
                                        <input class="form-control" id="ideal-hour-max" placeholder="Tranche horraire idéale maximum">
                                    </div>
                                    <span class="btn btn-primary">
                                        Filtrer
                                    </span>
                                </div>
                        </div>
                    </div>
                    <!--begin::table-->
                    <table class="table table-row-bordered gy-5" id="scenes-list">
                        <thead>
                            <tr class="fw-semibold fs-6 text-muted">
                                <th>Numéro de scène</th>
                                <th>Nombre d'acteurs</th>
                                <th>Plateau</th>
                                <th>Durée estimée</th>
                                <th>Début de la tranche horraire idéale</th>
                                <th>Fin de la tranche horraire idéale</th>
                            </tr>
                        </thead>
                        <tbody>

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
<script src="${pageContext.request.contextPath}/resources/assets/plugins/custom/datatables/datatables.bundle.js"></script>
<script>
    $("#scenes-list").DataTable({
        language: {
            url: "//cdn.datatables.net/plug-ins/1.13.3/i18n/fr-FR.json"
        }
    })
</script>
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

