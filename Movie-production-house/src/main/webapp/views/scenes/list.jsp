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
    $("#scenes-list thead tr")
        .clone(true)
        .addClass('filters')
        .appendTo("#scenes-list thead");
    $("#scenes-list").DataTable({
        language: {
            url: "//cdn.datatables.net/plug-ins/1.13.3/i18n/fr-FR.json"
        },
        orderCellsTop: true,
        fixedheader: true,
        initComplete: function() {
            let api = this.api();
            api
                .columns()
                .eq(0)
                .each(function(index) {
                    let cell = $('.filters th').eq($(api.column(index).header()).index());
                    let title = $(cell).text();
                    $(cell).html('<input type="text" class="form-control form-control-solid" placeholder="' + title + '" />');
                })
        }
    })
</script>

