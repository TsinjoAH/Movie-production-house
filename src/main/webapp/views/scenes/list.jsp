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
                    <div class="card-title">
                        <div class="d-flex align-items-center position-relative my-1">
                            <input class="form-control form-control-solid w-250px ps-14" type="text" placeholder="Rechercher une scene">
                        </div>
                    </div>
                    <div class="card-toolbar flex-row-fluid justify-content-end gap-5" data-select2-id="select2-data-123-mzxj">
                        <div class="w-100 mw-150px" data-select2-id="select2-data-122-7ipa">
                            <!--begin::Select2-->
                            <select class="form-select form-select-solid select2-hidden-accessible" data-control="select2"
                                    data-hide-search="true" data-placeholder="Status"
                                    data-kt-ecommerce-product-filter="status" data-select2-id="select2-data-10-dosa"
                                    tabindex="-1" aria-hidden="true" data-kt-initialized="1">
                                <option data-select2-id="select2-data-12-rf4k"></option>
                                <option value="all" data-select2-id="select2-data-128-d06c">All</option>
                                <option value="published" data-select2-id="select2-data-129-j8wq">Published</option>
                                <option value="scheduled" data-select2-id="select2-data-130-q4ue">Scheduled</option>
                                <option value="inactive" data-select2-id="select2-data-131-ndk1">Inactive</option>
                            </select>
                            <span class="select2 select2-container select2-container--bootstrap5 select2-container--below"
                                  dir="ltr" data-select2-id="select2-data-11-r1r7"
                                  style="width: 100%;">
                                <span class="selection">
                                    <span class="select2-selection select2-selection--single form-select form-select-solid"
                                          role="combobox" aria-haspopup="true" aria-expanded="false"
                                          tabindex="0" aria-disabled="false" aria-labelledby="select2-r1wb-container"
                                          aria-controls="select2-r1wb-container">
                                        <span class="select2-selection__rendered" id="select2-r1wb-container"
                                              role="textbox" aria-readonly="true" title="Status">
                                            <span class="select2-selection__placeholder">Status</span>
                                        </span>
                                        <span class="select2-selection__arrow" role="presentation">
                                            <b role="presentation"></b>
                                        </span>
                                    </span>
                                </span>
                                <span class="dropdown-wrapper" aria-hidden="true">
                                </span>
                            </span>
                            <!--end::Select2-->
                        </div>

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
    $("#scenes-list").DataTable({
        language: {
            url: "//cdn.datatables.net/plug-ins/1.13.3/i18n/fr-FR.json"
        }
    })
</script>

